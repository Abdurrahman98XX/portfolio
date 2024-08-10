import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract interface class Const {
  static const id = 'com.atumra.portfolio';
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
}

class OS {
  static const isWeb = kIsWeb || kIsWasm;
  static final isMobile = isAndroid || isIOS;
  static final isDesktop = isMacOS || isWindows || isLinux;
  static final isIOS = !isWeb && defaultTargetPlatform == TargetPlatform.iOS;
  static final isAndroid =
      !isWeb && defaultTargetPlatform == TargetPlatform.android;
  static final isMacOS =
      !isWeb && defaultTargetPlatform == TargetPlatform.macOS;
  static final isLinux =
      !isWeb && defaultTargetPlatform == TargetPlatform.linux;
  static final isWindows =
      !isWeb && defaultTargetPlatform == TargetPlatform.windows;
}
