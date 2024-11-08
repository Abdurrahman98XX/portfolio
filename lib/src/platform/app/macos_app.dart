import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart' as m;
import 'package:portfolio/src/platform/app_adaptive.dart';

class MacosApp extends AppInterface {
  MacosApp({super.key, required super.ref});
  @override
  Widget build(BuildContext context) {
    return m.MacosApp.router(
      key: key,
      locale: locale,
      actions: actions,
      themeMode: themeMode,
      shortcuts: shortcuts,
      // routerConfig: routerConfig,
      theme: m.MacosThemeData.light(),
      onGenerateTitle: onGenerateTitle,
      supportedLocales: supportedLocales,
      darkTheme: m.MacosThemeData.dark(),
      restorationScopeId: restorationScopeId,
      localizationsDelegates: localizationsDelegates,
    );
  }
}
