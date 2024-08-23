import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart'
    if (dart.library.js) 'package:logger/web.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:system_theme/system_theme.dart';

import 'package:portfolio/src/api/cache_api.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:portfolio/src/service/router.dart';
import 'package:portfolio/src/service/worker.dart';
import 'package:yaru/yaru.dart';

abstract interface class ServiceLocator {
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();

    // services initialization
    if (KPlatform.isMacOS) await const MacosWindowUtilsConfig().apply();
    if (KPlatform.isLinux) await YaruWindowTitleBar.ensureInitialized();

    // various packages configuration
    SystemTheme.fallbackColor = Colors.transparent;
    EquatableConfig.stringify = true;

    // TODO: always register services here
    getIt.registerSingleton(Client(), dispose: (i) => i.close());
    getIt.registerSingleton(Logger(), dispose: (i) => i.close());
    getIt.registerSingleton(globalRouter, dispose: (i) => i.dispose());
    getIt
        .registerFactoryParam((name, _) => CacheManager(group: name as String));
    getIt.registerSingleton(Worker(),
        instanceName: '1', dispose: (i) => i.kill());
  }

  static final client = getIt.get<Client>();
  static final logger = getIt.get<Logger>();
  static final router = getIt.get<GoRouter>();
  static final storage = getIt.get<CacheManager>;
  static final worker = getIt.get<Worker>(instanceName: '1');
  //
  static final getIt = GetIt.I;
  static String get key =>
      Global.encrypt([KPlatform.targetName, Global.appId]).toString();
}
