import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/common/platform.dart';
import 'package:portfolio/src/service/service_locator.dart';

abstract class KDeviceInfo {
  static final _provider = FutureProvider<BaseDeviceInfo>(
    name: 'KDeviceInfo._provider',
    (ref) {
      if (KPlatform.isAndroid) return ServiceLocator.deviceInfo.androidInfo;
      if (KPlatform.isIOS) return ServiceLocator.deviceInfo.iosInfo;
      if (KPlatform.isLinux) return ServiceLocator.deviceInfo.linuxInfo;
      if (KPlatform.isMacOS) return ServiceLocator.deviceInfo.macOsInfo;
      if (KPlatform.isWindows) return ServiceLocator.deviceInfo.windowsInfo;
      if (KPlatform.isBrowser) return ServiceLocator.deviceInfo.webBrowserInfo;
      throw 'do you really fucking using fuchsia???';
    },
  );

  static final androidProvider = Provider<AndroidDeviceInfo?>(
    name: 'KDeviceInfo.androidProvider',
    (ref) {
      final value = ref.watch(_provider).valueOrNull as AndroidDeviceInfo;
      return value;
    },
  );

  static final iosProvider = Provider<IosDeviceInfo?>(
    name: 'KDeviceInfo.iosProvider',
    (ref) {
      final value = ref.watch(_provider).valueOrNull as IosDeviceInfo;
      return value;
    },
  );

  static final linuxProvider = Provider<LinuxDeviceInfo?>(
    name: 'KDeviceInfo.linuxProvider',
    (ref) {
      final value = ref.watch(_provider).valueOrNull as LinuxDeviceInfo;
      return value;
    },
  );

  static final macosProvider = Provider<MacOsDeviceInfo?>(
    name: 'KDeviceInfo.macosProvider',
    (ref) {
      final value = ref.watch(_provider).valueOrNull as MacOsDeviceInfo;
      return value;
    },
  );

  static final windowsProvider = Provider<WindowsDeviceInfo?>(
    name: 'KDeviceInfo.windowsProvider',
    (ref) {
      final value = ref.watch(_provider).valueOrNull as WindowsDeviceInfo;
      return value;
    },
  );

  static final browserProvider = Provider<WebBrowserInfo?>(
    name: 'KDeviceInfo.browserProvider',
    (ref) {
      final value = ref.watch(_provider).valueOrNull as WebBrowserInfo;
      return value;
    },
  );
}
