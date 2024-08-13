import 'dart:async';
import 'package:http/http.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:system_theme/system_theme.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/src/common/const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:portfolio/src/service/worker_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'router.dart';

abstract interface class ServiceLocator {
  static final getIt = GetIt.instance;

  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    // firebase doesn't have linux
    if (!KPlatform.isLinux) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
    // various packages configuration
    SystemTheme.fallbackColor = Colors.transparent;
    await SystemTheme.accentColor.load();
    EquatableConfig.stringify = true;
    // TODO: always register services here
    getIt.registerLazySingleton(() => SharedPreferencesAsync());
    getIt.registerLazySingleton(
      () => _router,
      dispose: (instance) => instance.dispose(),
    );
    getIt.registerLazySingleton(
      () => Client(),
      dispose: (instance) => instance.close(),
    );
    getIt.registerLazySingleton(
      () => TalkerFlutter.init(),
      dispose: (instance) => instance.disable(),
    );
    getIt.registerLazySingleton(
      () => WorkerPlugin(),
      dispose: (instance) async => (await instance.controller).kill(),
    );
    await workerPlugin.controller;
  }

  static final router = getIt.get<GoRouter>();
  static final client = getIt.get<Client>();
  static final workerPlugin = getIt.get<WorkerPlugin>();
  static final logger = getIt.get<Talker>();
  static final storage = getIt.get<SharedPreferencesAsync>();
}
