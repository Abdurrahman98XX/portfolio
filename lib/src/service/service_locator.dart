import 'dart:async';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/src/common/const.dart';
import 'package:system_theme/system_theme.dart';
part 'router.dart';

abstract interface class ServiceLocator {
  static final getIt = GetIt.instance;
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    if ((Platform.isLinux && Const.isWeb) || !Platform.isLinux) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
    // TODO: always add services here
    SystemTheme.fallbackColor = Colors.transparent;
    await SystemTheme.accentColor.load();
    EquatableConfig.stringify = true;
    getIt.registerSingleton(_router);
    getIt.registerSingleton(Client());
  }

  static final router = getIt.get<GoRouter>();
  static final httpClient = getIt.get<Client>();
}
