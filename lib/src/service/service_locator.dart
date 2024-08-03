import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
part 'router.dart';

abstract interface class ServiceLocator {
  static final getIt = GetIt.instance;
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    getIt.registerSingleton(GlobalKey<ScaffoldMessengerState>());
    getIt.registerSingleton(_router);
    getIt.registerSingleton(Client());
    getIt.registerSingleton(GlobalKey<NavigatorState>());
  }

  static const id = 'com.atumra.portfolio';
  static GoRouter get router => getIt.get<GoRouter>();
  static Client get httpClient => getIt.get<Client>();
  static GlobalKey<NavigatorState> get navigatorKey =>
      getIt.get<GlobalKey<NavigatorState>>();
  static GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      getIt.get<GlobalKey<ScaffoldMessengerState>>();
}
