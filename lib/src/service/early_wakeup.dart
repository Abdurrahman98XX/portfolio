import 'package:http/http.dart';
import 'package:portfolio/src/api/cache_api.dart';
import 'package:portfolio/src/api/worker_api.dart';
import 'package:yaru/yaru.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:system_theme/system_theme.dart';
import 'package:portfolio/src/common/platform.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/service/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:portfolio/src/service/service_locator.dart';

final earlyWakeuprProvider = FutureProvider<void>(
  (ref) async {
    WidgetsFlutterBinding.ensureInitialized();
    deviceInfoProvider.overrideWithValue(await KDeviceInfo.instance);
    // services initialization
    if (KPlatform.isMacOS) await const MacosWindowUtilsConfig().apply();
    if (KPlatform.isLinux) await YaruWindowTitleBar.ensureInitialized();
    // various packages configuration
    SystemTheme.fallbackColor = Colors.transparent;
    EquatableConfig.stringify = true;
    // TODO: always register services here
    ServiceLocator.getIt.registerSingleton(Client(), dispose: (i) => i.close());
    ServiceLocator.getIt.registerSingleton(
      CacheManager(SharedPreferencesAsync()),
    );
    ServiceLocator.getIt.registerSingleton(
      WorkerApi(),
      instanceName: '1',
      dispose: (i) => i.kill(),
    );
  },
  name: 'earlyWakeuprProvider',
);
