import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/src/common/const.dart';
import 'package:portfolio/src/service/logger.dart';
import 'package:system_theme/system_theme.dart';
import 'package:talker_flutter/talker_flutter.dart';
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
    // TODO: always add services here
    getIt.registerSingleton(_router);
    getIt.registerSingleton(Client());
    getIt.registerSingleton(
      TalkerFlutter.init(observer: const LoggerObserver()),
    );
  }

  static GoRouter get router => getIt.get<GoRouter>();
  static Client get client => getIt.get<Client>();
  static Talker get logger => getIt.get<Talker>();
}
