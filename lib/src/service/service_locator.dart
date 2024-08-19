import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:system_theme/system_theme.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:portfolio/src/api/cache_api.dart';
import 'package:portfolio/src/common/const.dart';
import 'package:portfolio/src/module/theme/model/color_source_entity.dart';
import 'package:portfolio/src/module/theme/model/theme_mode_entity.dart';
import 'package:portfolio/src/module/theme/model/user_color_entity.dart';
import 'package:portfolio/src/service/hash_message.dart';
import 'package:portfolio/src/service/router.dart';
import 'package:portfolio/src/service/worker.dart';

abstract interface class ServiceLocator {
  static final getIt = GetIt.instance;

  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();

    // services initialization
    await SystemTheme.accentColor.load();
    if (KPlatform.isMacOS) await WindowManipulator.initialize();
    // if (!KPlatform.isLinux) {
    //   await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform,
    //   );
    // }

    // various packages configuration
    SystemTheme.fallbackColor = Colors.transparent;
    EquatableConfig.stringify = true;
    final dir = await getApplicationDocumentsDirectory();
    Hive.defaultDirectory = dir.path;
    Hive.registerAdapter<ColorSourceEntity>(
      'ColorSourceEntity',
      (json) => ColorSourceEntity.fromJson(json),
    );
    Hive.registerAdapter<ThemeModeEntity>(
      'ThemeModeEntity',
      (json) => ThemeModeEntity.fromJson(json),
    );
    Hive.registerAdapter<UserColorEntity>(
      'UserColorEntity',
      (json) => UserColorEntity.fromJson(json),
    );

    // TODO: always register services here
    getIt.registerSingleton(const HashMessage());
    getIt.registerSingleton(Client(), dispose: (i) => i.close());
    getIt.registerSingleton(globalRouter, dispose: (i) => i.dispose());
    getIt.registerSingleton(Worker(), instanceName: '1', dispose: (i) => i.kill());
    getIt.registerFactoryParam((name, _) => CacheManager(group: name as String));
  }

  static final client = getIt.get<Client>();
  static final logger = TalkerFlutter.init();
  static final router = getIt.get<GoRouter>();
  static final storage = getIt.get<CacheManager>;
  static final hasher = getIt.get<HashMessage>();
  static final worker = getIt.get<Worker>(instanceName: '1');
  static String get key => hasher.encrypt([Const.appId]).toString();
}
