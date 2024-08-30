import 'dart:async';
import 'dart:isolate';
import 'dart:developer';

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
  final Completer<void> _isolateReady = Completer.sync();

  /// if [true] (by default) prints time function consumed in milliseconds
  final bool useTimer;

  /// the requests worker reciver handles
  final RequestHandler? handleRequest;

  /// the data main reciever gets (you may use with [StreamBuilder] widget)
  late final responseStream = _mainReceivePort
      // if isolate is ready then filter out nulls and [SendPort]s
      // otherwise let it be as it is
      .where(
          (r) => _isolateReady.isCompleted ? r != null && r is! SendPort : true)
      .asBroadcastStream();

  /// worker spawner and life-cycle controller
  late final controller = Isolate.spawn(
    _handleMainRequests,
    // the first request injects worker => main send
    // channel and a function to handle main requests
    [_mainReceivePort.sendPort, handleRequest],
  );

  Future<void> kill() => controller.then((i) => i.kill());

  /// worker requests handler
  static void _handleMainRequests(injection) {
    // set worker reciver
    final workerReceivePort = ReceivePort();
    // worker => main send channel
    final mainSendPort = injection[0] as SendPort;
    // worker requests handler
    final handleRequest = injection[1] as RequestHandler?;
    // send back main => worker send channel
    mainSendPort.send(workerReceivePort.sendPort);
    // listen to main requests and handle it through worker requests handler
    workerReceivePort.listen(
      (request) async {
        final id = request[0];
        final req = await request[1]();
        // if true then req is a function with logic to handle
        // either if a global handler is set or not
        // if false then req is a value to be computed using the global handler
        final noGlobal = handleRequest == null || request[2];
        mainSendPort.send([id, noGlobal ? req : await handleRequest(req)]);
      },
    );
  }

  // completes inter-communication setup then return true
  bool _completeInterCommunicationSetup(response) {
    if (!_isolateReady.isCompleted) {
      _mainSendPort = response as SendPort;
      _isolateReady.complete();
      return true;
    }
    return false;
  }

  /// send a closure or global or static defind
  /// function to be computed in your worker
  ///
  /// ```
  /// final worker = Worker();
  /// final result = await worker.send(() => 1 + 1);
  /// print(result);
  /// ```
  // ignore: library_private_types_in_public_api
  FutureOr<R> send<R>(R Function() handler, [_Who who = _Who.function]) async {
    // waits for setup
    await _isolateReady.future;
    // time consumed calculator
    DateTime? start;
    Duration? duration;
    if (useTimer) start = DateTime.now();
    // assign this handler to a unique id (key)
    final id = _stack.length;
    // build the request to be sent
    final message = List.unmodifiable([id, handler, who == _Who.function]);
    // let the store have your message
    _stack = List.unmodifiable([message]);
    // send your message to worker
    _mainSendPort.send(message);
    // await for youe message's response that only matches id
    final result = (await responseStream.firstWhere((r) => r[0] == id))[1];
    // a complecated way of removing an item (message in this case)
    _stack = List.unmodifiable(_stack.where((e) => id != e[id]));
    // simple time diffrence calculation of consumed time
    if (useTimer) duration = DateTime.now().difference(start!);
    if (useTimer) {
      log(
        'request done in: ${duration!.inMilliseconds / 1000}S'
        '\nresult is: $result',
      );
      log(_stack.toString());
    }
    // dumping result
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
  List<List<dynamic>> _stack = List.unmodifiable([]);
}

enum _Who { value, function }
