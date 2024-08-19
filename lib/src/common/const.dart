import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/localization/localization.dart';

abstract interface class Const {
  static const appId = 'com.atumra.portfolio';
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static const localizations = [
    AppLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}

class KPlatform {
  static const isWeb = kIsWeb || kIsWasm;
  static final isMobile = isAndroid || isIOS;
  static final isDesktop = isMacOS || isWindows || isLinux;
  static final isIOS = !isWeb && target == TargetPlatform.iOS;
  static final isAndroid = !isWeb && target == TargetPlatform.android;
  static final isMacOS = !isWeb && target == TargetPlatform.macOS;
  static final isLinux = !isWeb && target == TargetPlatform.linux;
  static final isWindows = !isWeb && target == TargetPlatform.windows;
  static final target = defaultTargetPlatform;
}
