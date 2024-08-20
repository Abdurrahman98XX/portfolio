import 'package:device_info_plus/device_info_plus.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'k_device_info.g.dart';

abstract class KDeviceInfo {
  static final _i = DeviceInfoPlugin();

  static Future<BaseDeviceInfo> get instance {
    if (KPlatform.isIOS) return _i.iosInfo;
    if (KPlatform.isAndroid) return _i.androidInfo;
    if (KPlatform.isBrowser) return _i.webBrowserInfo;
    if (KPlatform.isMacOS) return _i.macOsInfo;
    if (KPlatform.isWindows) return _i.windowsInfo;
    if (KPlatform.isLinux) return _i.linuxInfo;
    throw 'do you really using fucking fuchsia???';
  }
}

@riverpod
BaseDeviceInfo deviceInfo(DeviceInfoRef ref) => throw UnimplementedError('deviceInfo');
