import 'package:device_info_plus/device_info_plus.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class KDeviceInfo {
  static final _i = DeviceInfoPlugin();

  static Future<BaseDeviceInfo> get instance {
    if (KPlatform.isIOS) return _i.iosInfo;
    if (KPlatform.isAndroid) return _i.androidInfo;
    if (KPlatform.isBrowser) return _i.webBrowserInfo;
    if (KPlatform.isMacOS) return _i.macOsInfo;
    if (KPlatform.isWindows) return _i.windowsInfo;
    if (KPlatform.isLinux) return _i.linuxInfo;
    throw 'do you really fucking using fuchsia???';
  }
}

final deviceInfoProvider = Provider<BaseDeviceInfo>(
  (_) => throw '',
  name: 'deviceInfoProvider',
);
