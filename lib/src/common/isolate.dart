import 'dart:isolate';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worker_manager/worker_manager.dart';

class PluginIsolate {
  void setup() {
    Isolate.spawn(pluginIsolate, RootIsolateToken.instance!);
  }

  Future<void> pluginIsolate(RootIsolateToken rootIsolateToken) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
  }
}

int _f(int n) => n < 1 ? n : n + _f(n - 1) + _f(n - 2);

final isoProvider = StreamProvider((ref) => cancelable.asStream());

Cancelable cancelable = workerManager.execute<int>(() async => _f(42));
