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
    getIt.registerSingleton(SharedPreferencesAsync());
    getIt.registerSingleton(
      _router,
      dispose: (instance) => instance.dispose(),
    );
    getIt.registerSingleton(
      Client(),
      dispose: (instance) => instance.close(),
    );
    getIt.registerSingleton(
      TalkerFlutter.init(),
      dispose: (instance) => instance.disable(),
    );
    getIt.registerSingleton(
      WorkerPlugin(),
      dispose: (instance) async => (await instance.controller).kill(),
    );
    await workerPlugin.controller;
  }

  static GoRouter get router => getIt.get<GoRouter>();
  static Client get client => getIt.get<Client>();
  static WorkerPlugin get workerPlugin => getIt.get<WorkerPlugin>();
  static Talker get logger => getIt.get<Talker>();
  static SharedPreferencesAsync get storage =>
      getIt.get<SharedPreferencesAsync>();
}
