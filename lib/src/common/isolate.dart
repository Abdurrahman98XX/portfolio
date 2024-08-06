import 'dart:isolate';
import 'package:flutter/services.dart';

class PluginIsolate {
  void setup() {
    Isolate.spawn(pluginIsolate, RootIsolateToken.instance!);
  }

  Future<void> pluginIsolate(RootIsolateToken rootIsolateToken) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
  }
}
