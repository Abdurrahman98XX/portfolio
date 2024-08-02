import 'dart:isolate';

import 'package:flutter/services.dart';

abstract interface class IsolateManager {}

class PluginIsolate implements IsolateManager {
  void setup() {
    Isolate.spawn(pluginIsolate, RootIsolateToken.instance!);
  }

  Future<void> pluginIsolate(RootIsolateToken rootIsolateToken) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
  }
}
