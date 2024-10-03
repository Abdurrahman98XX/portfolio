import 'package:fluent_ui/fluent_ui.dart';
import 'package:portfolio/src/platform/app/adaptive_app.dart';
// import 'package:window_manager/window_manager.dart';

class WindowsApp extends AppInterface {
  WindowsApp({super.key, required super.ref});
  @override
  Widget build(BuildContext context) {
    return FluentApp.router(
      key: key,
      locale: locale,
      actions: actions,
      shortcuts: shortcuts,
      themeMode: themeMode,
      // routerConfig: routerConfig,
      theme: FluentThemeData.light(),
      onGenerateTitle: onGenerateTitle,
      darkTheme: FluentThemeData.dark(),
      supportedLocales: supportedLocales,
      restorationScopeId: restorationScopeId,
      localizationsDelegates: localizationsDelegates,
    );
  }
}
