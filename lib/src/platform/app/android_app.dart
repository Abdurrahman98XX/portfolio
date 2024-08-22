import 'package:flutter/material.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({
    super.key,
    this.backButtonDispatcher,
    this.darkTheme,
    this.theme,
    this.locale,
    this.onGenerateTitle,
    this.scaffoldMessengerKey,
    this.localizationsDelegates,
    this.restorationScopeId,
    this.routeInformationParser,
    this.routeInformationProvider,
    this.routerDelegate,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.themeMode,
    this.shortcuts,
  });
  final BackButtonDispatcher? backButtonDispatcher;
  final ThemeData? darkTheme;
  final ThemeData? theme;
  final Locale? locale;
  final String Function(BuildContext)? onGenerateTitle;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final String? restorationScopeId;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouteInformationProvider? routeInformationProvider;
  final RouterDelegate<Object>? routerDelegate;
  final Iterable<Locale> supportedLocales;
  final ThemeMode? themeMode;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      backButtonDispatcher: backButtonDispatcher,
      darkTheme: darkTheme,
      theme: theme,
      key: key,
      locale: locale,
      onGenerateTitle: onGenerateTitle,
      scaffoldMessengerKey: scaffoldMessengerKey,
      localizationsDelegates: localizationsDelegates,
      restorationScopeId: restorationScopeId,
      routeInformationParser: routeInformationParser,
      routeInformationProvider: routeInformationProvider,
      routerDelegate: routerDelegate,
      supportedLocales: supportedLocales,
      themeMode: themeMode,
      shortcuts: shortcuts,
    );
  }
}
