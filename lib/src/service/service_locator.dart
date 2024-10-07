import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:portfolio/src/api/cache_api.dart';
import 'package:portfolio/src/api/worker_api.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:portfolio/src/common/platform.dart';
import 'package:portfolio/src/service/client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_theme/system_theme.dart';
import 'package:yaru/yaru.dart';

abstract interface class ServiceLocator {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (KPlatform.isMacOS) await const MacosWindowUtilsConfig().apply();
    if (KPlatform.isLinux) await YaruWindowTitleBar.ensureInitialized();

    // various packages configuration
    SystemTheme.fallbackColor = Colors.transparent;
    EquatableConfig.stringify = true;

    // TODO: always register services here
    ServiceLocator.getIt.registerSingleton(
      Connectivity(),
    );
    ServiceLocator.getIt.registerSingleton(
      DeviceInfoPlugin(),
    );
    ServiceLocator.getIt.registerSingleton(
      CacheManager(SharedPreferencesAsync()),
    );
    ServiceLocator.getIt.registerSingleton(
      KClient.service()(),
      dispose: (i) => i.close(),
    );
    ServiceLocator.getIt.registerSingleton(
      WorkerApi(),
      instanceName: 'worker 1',
      dispose: (i) => i.kill(),
    );
  }

  static final client = getIt.get<Client>();
  static final cache = getIt.get<CacheManager>();
  static final connection = getIt.get<Connectivity>();
  static final deviceInfo = getIt.get<DeviceInfoPlugin>();
  static final worker = getIt.get<WorkerApi>(instanceName: '1');
  //
  static final getIt = GetIt.I;
}
