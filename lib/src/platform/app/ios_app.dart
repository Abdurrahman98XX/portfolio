import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:portfolio/src/platform/app/adaptive_app.dart';

class IosApp extends AppInterface {
  IosApp({super.key, required super.ref});
  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      key: key,
      locale: locale,
      actions: actions,
      shortcuts: shortcuts,
      // routerConfig: routerConfig,
      onGenerateTitle: onGenerateTitle,
      supportedLocales: supportedLocales,
      restorationScopeId: restorationScopeId,
      localizationsDelegates: localizationsDelegates,
      theme: CupertinoThemeData(
        brightness: switch (themeMode) {
          ThemeMode.dark => Brightness.dark,
          ThemeMode.light => Brightness.light,
          ThemeMode.system =>
            KPlatform.isLight ? Brightness.light : Brightness.dark,
        },
      ),
    );
  }
}
