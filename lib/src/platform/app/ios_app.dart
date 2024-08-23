import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/common/global.dart';

class IosApp extends StatelessWidget {
  const IosApp({
    super.key,
    this.backButtonDispatcher,
    this.theme,
    this.locale,
    this.onGenerateTitle,
    this.localizationsDelegates,
    this.restorationScopeId,
    this.routeInformationParser,
    this.routeInformationProvider,
    this.routerDelegate,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.shortcuts,
    this.actions,
    this.darkTheme,
    this.themeMode,
  });
  final BackButtonDispatcher? backButtonDispatcher;
  final CupertinoThemeData? theme;
  final CupertinoThemeData? darkTheme;
  final ThemeMode? themeMode;
  final Locale? locale;
  final String Function(BuildContext)? onGenerateTitle;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final String? restorationScopeId;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouteInformationProvider? routeInformationProvider;
  final RouterDelegate<Object>? routerDelegate;
  final Iterable<Locale> supportedLocales;
  final Map<Type, Action<Intent>>? actions;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      actions: {...WidgetsApp.defaultActions, ...?actions},
      backButtonDispatcher: backButtonDispatcher,
      theme: switch (themeMode) {
        ThemeMode.dark => darkTheme,
        ThemeMode.light => theme,
        _ => KPlatform.isLight ? theme : darkTheme,
      },
      key: key,
      locale: locale,
      onGenerateTitle: onGenerateTitle,
      localizationsDelegates: localizationsDelegates,
      restorationScopeId: restorationScopeId,
      routeInformationParser: routeInformationParser,
      routeInformationProvider: routeInformationProvider,
      routerDelegate: routerDelegate,
      supportedLocales: supportedLocales,
      shortcuts: shortcuts,
    );
  }
}
