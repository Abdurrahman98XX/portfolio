import 'dart:async';
import 'dart:isolate';

class Worker {
  Worker({required this.handleRequest, required this.handleResponse}) {
    responseStream.listen(_handleWorkerResponses);
  }
  late final ReceivePort _workerReceivePort;
  final _mainReceivePort = ReceivePort();
  final Completer<void> _isolateReady = Completer.sync();
  late final responseStream = _mainReceivePort.asBroadcastStream();
  final void Function(dynamic request, SendPort workerSendPort) handleRequest;
  final void Function(dynamic response) handleResponse;
  late final controller = Isolate.spawn(
    _handleMainRequestsShadow,
    _mainReceivePort,
  );

  void _handleMainRequestsShadow(ReceivePort mainReceivePort) {
    return _handleMainRequests(
        mainReceivePort, (r, sp) => handleRequest(r, sp));
  }

  static void _handleMainRequests(
    ReceivePort mainReceivePort,
    void Function(dynamic, SendPort) onRequest,
  ) {
    final workerReceivePort = ReceivePort();
    mainReceivePort.sendPort.send(workerReceivePort);
    workerReceivePort.listen(
      (requset) => onRequest(requset, workerReceivePort.sendPort),
    );
  }

  void _handleWorkerResponses(response) {
    if (!_isolateReady.isCompleted) {
      _workerReceivePort = response as ReceivePort;
      _isolateReady.complete();
    }
    return handleResponse(response);
  }

  Future<void> send(message) async {
    await _isolateReady.future;
    _workerReceivePort.sendPort.send(message);
  }
}
