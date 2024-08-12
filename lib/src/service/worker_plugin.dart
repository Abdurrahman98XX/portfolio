import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'package:flutter/services.dart';
import 'package:portfolio/src/service/service_locator.dart';

/// a singleton class to instantiate an isolate works with plugins
class WorkerPlugin {
  WorkerPlugin._();
  factory WorkerPlugin() => _i;
  static final _i = WorkerPlugin._();

  // port that plugin isolate uses to send responses
  late final SendPort _mainSendPort;
  // a marker informs that's completed inter-communications correctly
  final Completer<void> _isolateReady = Completer.sync();

  /// controls the plugin's isolate life cycle
  late final Future<Isolate> controller = _spawn();

  /// to get responses from plugin isolate
  final mainReceivePort = ReceivePort();

  // spawn the plugin's isolate
  Future<Isolate> _spawn() {
    // instantiates a plugin isolate token
    final rootToken = RootIsolateToken.instance!;
    // handle responses from plugin isolate
    mainReceivePort.listen(_handlePluginWorkerResponses);
    // spawn the plugin isolate
    return Isolate.spawn(
      // final worker = await Isolate.spawn(
      // plugin isolate's requests initializer and requests handler
      _pluginWorker,
      // main isolate sends its root token and send port to get
      // responses from plugin's isolate as the first message
      {'rootToken': rootToken, 'mainSendPort': mainReceivePort.sendPort},
    );
    // sets plugin's isolate sync object to a public controller
    // to manage it's life cycle
    // _controller = worker;
  }

  // plugin isolate's requests initializer and requests handler
  static void _pluginWorker(
    // the type of the first request (message)
    Map<String, Object> message,
  ) {
    // to get requests from main isolate
    final pluginReceivePort = ReceivePort();
    // decoding the first message
    final mainSendPort = message['mainSendPort'] as SendPort;
    final rootToken = message['rootToken'] as RootIsolateToken;
    // initialize the binary plugin isolate using root token
    BackgroundIsolateBinaryMessenger.ensureInitialized(rootToken);
    // plugin isolate sends its send port to get
    // requests from main as the first message
    mainSendPort.send(pluginReceivePort.sendPort);
    // handle requests from main isolate
    pluginReceivePort.listen((m) => mainSendPort.send(jsonDecode(m)));
  }

  // handles what main receives
  void _handlePluginWorkerResponses(dynamic message) {
    // when getting plugin worker's first message
    if (message is SendPort) {
      // assign the main isolate's send port to be used when sending requests
      _mainSendPort = message;
      // mark the isolate as ready to be used
      _isolateReady.complete();
    }
    // TODO: handle data (with stream for example)
  }

  /// a function that takes undecoded
  /// json and sends a request to decode it
  Future<void> parseJson(String message) async {
    ServiceLocator.logger.debug('parseJson started');
    await _isolateReady.future;
    _mainSendPort.send(message);
  }
}
