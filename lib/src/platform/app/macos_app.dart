import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart' as m;

class MacosApp extends StatelessWidget {
  const MacosApp({
    super.key,
    this.backButtonDispatcher,
    this.darkTheme,
    this.theme,
    this.locale,
    this.onGenerateTitle,
    this.localizationsDelegates,
    this.restorationScopeId,
    this.routeInformationParser,
    this.routeInformationProvider,
    this.routerDelegate,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.themeMode,
    this.shortcuts,
    this.actions,
  });
  final BackButtonDispatcher? backButtonDispatcher;
  final m.MacosThemeData? darkTheme;
  final m.MacosThemeData? theme;
  final Locale? locale;
  final String Function(BuildContext)? onGenerateTitle;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final String? restorationScopeId;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouteInformationProvider? routeInformationProvider;
  final RouterDelegate<Object>? routerDelegate;
  final Iterable<Locale> supportedLocales;
  final ThemeMode? themeMode;
  final Map<Type, Action<Intent>>? actions;
  final Map<ShortcutActivator, Intent>? shortcuts;
  @override
  Widget build(BuildContext context) {
    return m.MacosApp.router(
      backButtonDispatcher: backButtonDispatcher,
      actions: {...WidgetsApp.defaultActions, ...?actions},
      darkTheme: darkTheme,
      theme: theme,
      key: key,
      locale: locale,
      onGenerateTitle: onGenerateTitle,
      localizationsDelegates: localizationsDelegates,
      restorationScopeId: restorationScopeId,
      routeInformationParser: routeInformationParser,
      routeInformationProvider: routeInformationProvider,
      routerDelegate: routerDelegate,
      supportedLocales: supportedLocales,
      themeMode: themeMode,
      shortcuts: {...WidgetsApp.defaultShortcuts as Map, ...?shortcuts as Map?},
    );
  }
}
