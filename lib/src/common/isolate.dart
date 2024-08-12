// import 'dart:isolate';
// import 'package:flutter/services.dart';

// void main(List<String> args) async {
//   RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
//   final receiveIsoPort = ReceivePort();
//   final start = await iso((token: rootIsolateToken, port: receiveIsoPort));
//   start.controlPort.send(receiveIsoPort.sendPort);
//   receiveIsoPort.listen(print);
// }

// Future<Isolate> iso(({RootIsolateToken token, ReceivePort port}) param) {
//   return Isolate.spawn(pluginIsolate, param);
// }

// Future<void> pluginIsolate(
//     ({RootIsolateToken token, ReceivePort port}) param) async {
//   BackgroundIsolateBinaryMessenger.ensureInitialized(param.token);
//   final SendPort sendMainPort = await param.port.first;
//   for (var i = 0; i < 20; i++) {
//     await Future.delayed(const Duration(milliseconds: 100));
//     sendMainPort.send('num $i from iso');
//   }
// }
