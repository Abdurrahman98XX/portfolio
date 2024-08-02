import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/src/common/service_locator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      restorationScopeId: 'app',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      supportedLocales: const [Locale('en', '')],
      routerDelegate: ServiceLocator.router.routerDelegate,
      scaffoldMessengerKey: ServiceLocator.scaffoldMessengerKey,
      backButtonDispatcher: ServiceLocator.router.backButtonDispatcher,
      routeInformationParser: ServiceLocator.router.routeInformationParser,
      routeInformationProvider: ServiceLocator.router.routeInformationProvider,
      onGenerateTitle: (BuildContext context) {
        return AppLocalizations.of(context)!.appTitle;
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
