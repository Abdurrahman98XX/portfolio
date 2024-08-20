import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:portfolio/src/service/service_locator.dart';

abstract class KDeviceInfo {
  static String? rgisterAndLocateDeviceInfo() {
    final String name;
    switch (KPlatform.target) {
      case TargetPlatform.iOS:
        name = TargetPlatform.iOS.name;
        ServiceLocator.getIt.registerSingletonAsync(
          () => DeviceInfoPlugin().iosInfo,
          instanceName: name,
        );
        return name;
      case TargetPlatform.linux:
        name = TargetPlatform.linux.name;
        ServiceLocator.getIt.registerSingletonAsync(
          () => DeviceInfoPlugin().linuxInfo,
          instanceName: name,
        );
        return name;
      case TargetPlatform.macOS:
        name = TargetPlatform.macOS.name;
        ServiceLocator.getIt.registerSingletonAsync(
          () => DeviceInfoPlugin().macOsInfo,
          instanceName: name,
        );
        return name;
      case TargetPlatform.android:
        name = TargetPlatform.android.name;
        ServiceLocator.getIt.registerSingletonAsync(
          () => DeviceInfoPlugin().androidInfo,
          instanceName: name,
        );
        return name;
      case TargetPlatform.windows:
        name = TargetPlatform.windows.name;
        ServiceLocator.getIt.registerSingletonAsync(
          () => DeviceInfoPlugin().windowsInfo,
          instanceName: TargetPlatform.windows.name,
        );
        return name;
      default:
        name = 'browser';
        ServiceLocator.getIt.registerSingletonAsync(
          () => DeviceInfoPlugin().webBrowserInfo,
          instanceName: name,
        );
        WebBrowserInfo;
        return name;
    }
  }
}
