import 'package:flutter/material.dart';
import 'package:portfolio/src/localization/localization.dart';

abstract interface class Global {
  static const appId = 'com.atumra.portfolio';
  static final navigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'navigatorKey',
  );
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>(
    debugLabel: 'scaffoldMessengerKey',
  );
  static const localizations = [
    AppLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  // TODO: update generative title
  static String onGenerateTitle(BuildContext context) {
    return context.l10n.appTitle;
  }
}
