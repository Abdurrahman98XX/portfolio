import 'package:flutter/material.dart';
import 'package:portfolio/src/platform/app/adaptive_app.dart';
import 'package:portfolio/src/platform/router/android_router.dart';

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
      onGenerateTitle: onGenerateTitle,
      supportedLocales: supportedLocales,
      restorationScopeId: restorationScopeId,
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: ref.watch(androidRouterProvider),
      localizationsDelegates: localizationsDelegates,
    );
  }
}
