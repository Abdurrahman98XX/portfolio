import 'package:flutter/material.dart';
import 'package:portfolio/src/common/const.dart';
import 'package:portfolio/src/localization/shit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/module/theme/controller/auto_system_color_controller.dart';
import 'package:portfolio/src/service/service_locator.dart';
import 'package:portfolio/src/module/theme/controller/theme_mode_controller.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final themeMode = ref.watch(themeModeControllerProvider).themeMode;
        final s = ref.watch(autoSystemColorProvider).value;
        return MaterialApp.router(
          restorationScopeId: Const.id,
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: s ?? Colors.brown,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: s ?? Colors.brown,
              brightness: Brightness.dark,
            ),
          ),
          scaffoldMessengerKey: Const.scaffoldMessengerKey,
          supportedLocales: AppLocalizations.supportedLocales,
          routerDelegate: ServiceLocator.router.routerDelegate,
          themeMode: themeMode,
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
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
