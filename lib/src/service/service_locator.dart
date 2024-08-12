import 'dart:async';
import 'dart:isolate';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/src/common/const.dart';
import 'package:portfolio/src/service/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_theme/system_theme.dart';
import 'package:talker_flutter/talker_flutter.dart';
part 'router.dart';

abstract interface class ServiceLocator {
  static final getIt = GetIt.instance;
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();

//

    RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
    final receiveIsoPort = ReceivePort();
    final start = await iso((token: rootIsolateToken, port: receiveIsoPort));
    start.controlPort.send(receiveIsoPort.sendPort);
    receiveIsoPort.listen(print);

//

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
    getIt.registerSingleton(SharedPreferencesAsync());
    getIt.registerSingleton(
      TalkerFlutter.init(observer: const LoggerObserver()),
    );
  }

  static GoRouter get router => getIt.get<GoRouter>();
  static Client get client => getIt.get<Client>();
  static Talker get logger => getIt.get<Talker>();
  static SharedPreferencesAsync get storage =>
      getIt.get<SharedPreferencesAsync>();
}

//

//

Future<Isolate> iso(({RootIsolateToken token, ReceivePort port}) param) {
  return Isolate.spawn(pluginIsolate, param);
}

Future<void> pluginIsolate(
    ({RootIsolateToken token, ReceivePort port}) param) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(param.token);
  final SendPort sendMainPort = await param.port.first;
  for (var i = 0; i < 20; i++) {
    await Future.delayed(const Duration(milliseconds: 100));
    sendMainPort.send('num $i from iso');
  }
}
