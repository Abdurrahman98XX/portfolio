import 'package:flutter/material.dart';
import 'package:portfolio/src/common/const.dart';
import 'package:portfolio/src/service/service_locator.dart';
import 'localization/shit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: theme controller
    return MaterialApp.router(
      restorationScopeId: Const.id,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      supportedLocales: const [Locale('en', '')],
      routerDelegate: ServiceLocator.router.routerDelegate,
      scaffoldMessengerKey: Const.scaffoldMessengerKey,
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
