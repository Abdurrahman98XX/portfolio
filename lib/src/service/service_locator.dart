import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/src/common/const.dart';
part 'router.dart';

abstract interface class ServiceLocator {
  static final getIt = GetIt.instance;
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    // exclude Firebase initialization for Linux
    if ((Platform.isLinux && Const.isWeb) || !Platform.isLinux) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
    // TODO
    getIt.registerSingleton(_router);
    getIt.registerSingleton(Client());
  }

  static final router = getIt.get<GoRouter>();
  static final httpClient = getIt.get<Client>();
}
