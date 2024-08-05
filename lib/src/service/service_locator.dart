import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:macos_ui/macos_ui.dart';
part 'router.dart';

abstract interface class ServiceLocator {
  static final getIt = GetIt.instance;
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    getIt.registerSingleton(_router);
    getIt.registerSingleton(Client());
  }

  static const id = 'com.atumra.portfolio';
  static final router = getIt.get<GoRouter>();
  static final httpClient = getIt.get<Client>();
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
}
