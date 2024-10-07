import 'package:flutter/material.dart';
import 'package:portfolio/src/platform/app_adaptive.dart';

class AndroidApp extends AppInterface {
  AndroidApp({super.key, required super.ref});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: key,
      theme: theme,
      locale: locale,
      actions: actions,
      darkTheme: darkTheme,
      shortcuts: shortcuts,
      themeMode: themeMode,
      routerConfig: routerConfig,
      onGenerateTitle: onGenerateTitle,
      supportedLocales: supportedLocales,
      restorationScopeId: restorationScopeId,
      scaffoldMessengerKey: scaffoldMessengerKey,
      localizationsDelegates: localizationsDelegates,
    );
  }
}
