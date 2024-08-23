import 'package:fluent_ui/fluent_ui.dart';
// import 'package:window_manager/window_manager.dart';

class WindowsApp extends StatelessWidget {
  const WindowsApp({
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
  final FluentThemeData? darkTheme;
  final FluentThemeData? theme;
  final Locale? locale;
  final String Function(BuildContext)? onGenerateTitle;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final String? restorationScopeId;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouteInformationProvider? routeInformationProvider;
  final RouterDelegate<Object>? routerDelegate;
  final Iterable<Locale> supportedLocales;
  final ThemeMode? themeMode;
  final Map<Type, Action<Intent>>? actions;

  @override
  Widget build(BuildContext context) {
    return FluentApp.router(
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
      shortcuts: {...WidgetsApp.defaultShortcuts, ...?shortcuts},
    );
  }
}
