import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/common/const.dart';
import 'package:portfolio/src/module/theme_mode/theme_mode_controller.dart';
import 'package:portfolio/src/service/service_locator.dart';
import 'package:portfolio/src/localization/shit.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return MaterialApp.router(
          restorationScopeId: Const.id,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          scaffoldMessengerKey: Const.scaffoldMessengerKey,
          supportedLocales: AppLocalizations.supportedLocales,
          routerDelegate: ServiceLocator.router.routerDelegate,
          themeMode: ref.watch(themeModeControllerProvider).themeMode,
          backButtonDispatcher: ServiceLocator.router.backButtonDispatcher,
          routeInformationParser: ServiceLocator.router.routeInformationParser,
          routeInformationProvider:
              ServiceLocator.router.routeInformationProvider,
          // TODO: update generative title
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
      },
    );
  }
}
