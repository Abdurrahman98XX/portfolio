import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/src/localization/localization.dart';

abstract interface class Global {
  static const appId = 'com.atumra.portfolio';
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static const localizations = [
    AppLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  // TODO: update generative title
  static String onGenerateTitle(BuildContext context) {
    return AppLocalizations.of(context)!.appTitle;
  }

  static Digest encrypt(List<String> messages) {
    final output = AccumulatorSink<Digest>();
    var input = sha512256.startChunkedConversion(output);
    // ignore: curly_braces_in_flow_control_structures
    for (var message in messages) input.add(utf8.encode(message));
    input.close();
    final digest = output.events.single;
    return digest;
  }
}

class KPlatform {
  static const isBrowser = kIsWeb || kIsWasm;
  static final isMobile = isAndroid || isIOS;
  static final isDesktop = isMacOS || isWindows || isLinux;
  static final isIOS = !isBrowser && target == TargetPlatform.iOS;
  static final isAndroid = !isBrowser && target == TargetPlatform.android;
  static final isMacOS = !isBrowser && target == TargetPlatform.macOS;
  static final isLinux = !isBrowser && target == TargetPlatform.linux;
  static final isWindows = !isBrowser && target == TargetPlatform.windows;
  static final target = defaultTargetPlatform;
}
