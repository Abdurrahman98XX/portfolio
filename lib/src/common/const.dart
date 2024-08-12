import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract interface class Const {
  static const id = 'com.atumra.portfolio';
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
}

class KPlatform {
  static const isWeb = kIsWeb || kIsWasm;
  static final isMobile = isAndroid || isIOS;
  static final isDesktop = isMacOS || isWindows || isLinux;
  static final isIOS = !isWeb && name == TargetPlatform.iOS;
  static final isAndroid = !isWeb && name == TargetPlatform.android;
  static final isMacOS = !isWeb && name == TargetPlatform.macOS;
  static final isLinux = !isWeb && name == TargetPlatform.linux;
  static final isWindows = !isWeb && name == TargetPlatform.windows;
  static final name = defaultTargetPlatform;
}
