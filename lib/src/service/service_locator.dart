import 'dart:async';
import 'package:http/http.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:system_theme/system_theme.dart';
import 'package:portfolio/src/common/const.dart';
import 'package:portfolio/src/service/worker.dart';
import 'package:portfolio/src/service/router.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    // TODO: always register services here
    getIt.registerSingleton(SharedPreferencesAsync());
    getIt.registerSingleton(
      globalRouter,
      dispose: (instance) => instance.dispose(),
    );
    getIt.registerSingleton(
      Client(),
      dispose: (instance) => instance.close(),
    );
    getIt.registerSingleton(
      Worker(),
      instanceName: 'w1',
      dispose: (param) async => (await param.controller).kill(),
    );
  }

  static final client = getIt.get<Client>();
  static final logger = TalkerFlutter.init();
  static final router = getIt.get<GoRouter>();
  static final storage = getIt.get<SharedPreferencesAsync>();
  static final worker = getIt.get<Worker>(instanceName: 'w1');
}
