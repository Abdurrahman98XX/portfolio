import 'dart:async';
import 'dart:isolate';

typedef RequestHandler = Function(dynamic request);

class Worker {
  Worker({this.handleRequest, this.useTimer = true}) {
    // run the [Isolate.spawn]
    (() => controller)();
    // listen to the first response in order to complete setup
    responseStream.firstWhere(_completeInterCommunicationSetup);
  }
  // send requests to worker (to be set by worker)
  late final SendPort _mainSendPort;
  // main reciever
  final _mainReceivePort = ReceivePort();
  // setup completion marker
  final Completer<void> _ready = Completer.sync();

  /// if [true] (by default) prints time function consumed in milliseconds
  final bool useTimer;

  /// the requests worker reciver handles
  final RequestHandler? handleRequest;

  /// the data main reciever gets (you may use with [StreamBuilder] widget)
  late final responseStream = _mainReceivePort
      .distinct()
      .where((r) => _ready.isCompleted ? r != null && r is! SendPort : true)
      .asBroadcastStream();

  /// worker spawner and life-cycle controller
  late final controller = Isolate.spawn(
    _handleWorkerRequests,
    [_mainReceivePort.sendPort, handleRequest],
  );

  Future<void> kill() => controller.then((i) => i.kill());

  /// worker requests handler
  static void _handleWorkerRequests(injection) {
    final workerReceivePort = ReceivePort();
    final mainSendPort = injection[0] as SendPort;
    final globalFunction = injection[1] as RequestHandler?;
    mainSendPort.send(workerReceivePort.sendPort);
    workerReceivePort.listen(
      (request) async {
        final id = request[0];
        final res = await request[1]();
        final isClousre = request[2] || globalFunction == null;
        mainSendPort.send([id, isClousre ? res : await globalFunction(res)]);
      },
    );
  }

  // completes inter-communication setup then return true
  bool _completeInterCommunicationSetup(response) {
    if (!_ready.isCompleted) {
      _mainSendPort = response as SendPort;
      _ready.complete();
      return true;
    }
    return false;
  }

  /// send a closure, global or static defind
  /// function to be computed in your worker
  ///
  /// ```
  /// final worker = Worker();
  /// final result = await worker.send(() => 1 + 1);
  /// print(result);
  /// ```
  // ignore: library_private_types_in_public_api
  FutureOr<R> send<R>(R Function() handler, [_Who who = _Who.clousre]) async {
    await _ready.future;
    final id = _stack.length;
    final message = [id, handler, who == _Who.clousre];
    _stack.add(message);
    _mainSendPort.send(message);
    final result = (await responseStream.firstWhere((r) => r[0] == id))[1];
    _stack.removeWhere((e) => e[0] == id);
    return result;
  }

  /// CAUTION: NEVER USE THIS METHOD WHILE NOT DEFINING [handleRequest] PROP
  ///
  /// send a request/message to be computed using
  /// the predefined [Worker.handleRequest] prop
  ///
  /// ```
  /// final worker = Worker( handleRequest: (request) async {
  ///   if (request is String) return json.decode(request);
  ///   });
  ///
  /// final result = await worker.sendData('{name: "boody, age: 25}');
  /// print(result);
  /// ```
  FutureOr<R> sendData<R>(R message) => handleRequest == null
      ? throw 'you didn\'t set [handleRequest] prop'
      : send(() => message, _Who.value);

  // our request stack
  final List<List> _stack = [];
}

enum _Who { value, clousre }
