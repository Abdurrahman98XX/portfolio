import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart' if (dart.library.js) 'package:logger/web.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:system_theme/system_theme.dart';

import 'package:portfolio/src/api/cache_api.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:portfolio/src/module/theme/model/color_source_entity.dart';
import 'package:portfolio/src/module/theme/model/theme_mode_entity.dart';
import 'package:portfolio/src/module/theme/model/user_color_entity.dart';
import 'package:portfolio/src/service/router.dart';
import 'package:portfolio/src/service/worker.dart';

abstract interface class ServiceLocator {
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();

    // services initialization
    Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
    if (KPlatform.isMacOS) await WindowManipulator.initialize();
    await SystemTheme.accentColor.load();
    // if (!KPlatform.isLinux) {
    //   await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform,
    //   );
    // }

    // various packages configuration
    SystemTheme.fallbackColor = Colors.transparent;
    EquatableConfig.stringify = true;
    Hive.registerAdapter(
      'ColorSourceEntity',
      (json) => ColorSourceEntity.fromJson(json),
    );
    Hive.registerAdapter(
      'ThemeModeEntity',
      (json) => ThemeModeEntity.fromJson(json),
    );
    Hive.registerAdapter(
      'UserColorEntity',
      (json) => UserColorEntity.fromJson(json),
    );

    // TODO: always register services here
    getIt.registerSingleton(Client(), dispose: (i) => i.close());
    getIt.registerSingleton(Logger(), dispose: (i) => i.close());
    getIt.registerSingleton(globalRouter, dispose: (i) => i.dispose());
    getIt.registerFactoryParam((name, _) => CacheManager(group: name as String));
    getIt.registerSingleton(Worker(), instanceName: '1', dispose: (i) => i.kill());
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
