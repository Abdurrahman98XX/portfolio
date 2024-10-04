import 'package:flutter/foundation.dart';

abstract interface class KPlatform {
  static const isBrowser = kIsWeb || kIsWasm;
  static final isMobile = isAndroid || isIOS;
  static final isDesktop = isMacOS || isWindows || isLinux;
  static final isApple = isMacOS || isIOS;
  static final isIOS = !isBrowser && host == TargetPlatform.iOS;
  static final isAndroid = !isBrowser && host == TargetPlatform.android;
  static final isMacOS = !isBrowser && host == TargetPlatform.macOS;
  static final isLinux = !isBrowser && host == TargetPlatform.linux;
  static final isWindows = !isBrowser && host == TargetPlatform.windows;
  static final isCanvasKitEnabled = isCanvasKit;
  static final host = defaultTargetPlatform;
  static final targetName = isBrowser ? 'browser' : host.name;
  static bool get isLight =>
      PlatformDispatcher.instance.platformBrightness == Brightness.light;
}
