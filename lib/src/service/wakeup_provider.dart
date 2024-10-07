import 'package:portfolio/src/service/device_info.dart';
import 'package:portfolio/src/common/platform.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/service/internet_check.dart';

final wakeUpProvider = FutureProvider<void>(
  name: 'earlyWakeuprProvider',
  (ref) async {
    ref.read(internetCheckProvider);
    if (KPlatform.isAndroid) ref.read(KDeviceInfo.androidProvider);
    if (KPlatform.isIOS) ref.read(KDeviceInfo.iosProvider);
    if (KPlatform.isLinux) ref.read(KDeviceInfo.linuxProvider);
    if (KPlatform.isMacOS) ref.read(KDeviceInfo.macosProvider);
    if (KPlatform.isWindows) ref.read(KDeviceInfo.windowsProvider);
    if (KPlatform.isBrowser) ref.read(KDeviceInfo.browserProvider);
  },
);
