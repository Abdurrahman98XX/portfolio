import 'package:flutter/material.dart';
import 'package:portfolio/src/common/const.dart';
import 'package:portfolio/src/localization/localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/service/service_locator.dart';
import 'package:portfolio/src/module/theme/controller/auto_system_color_controller.dart';
import 'package:portfolio/src/module/theme/controller/theme_mode_controller.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final themeMode = ref.watch(themeModeControllerProvider).themeMode;
        final color = ref.watch(autoSystemColorProvider).value;
        return MaterialApp.router(
          themeMode: themeMode,
          restorationScopeId: Const.id,
          localizationsDelegates: Const.localizations,
          scaffoldMessengerKey: Const.scaffoldMessengerKey,
          supportedLocales: AppLocalizations.supportedLocales,
          routerDelegate: ServiceLocator.router.routerDelegate,
          backButtonDispatcher: ServiceLocator.router.backButtonDispatcher,
          routeInformationParser: ServiceLocator.router.routeInformationParser,
          routeInformationProvider:
              ServiceLocator.router.routeInformationProvider,
          // TODO: update generative title
          onGenerateTitle: (BuildContext context) {
            return AppLocalizations.of(context)!.appTitle;
          },
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: color ?? Colors.brown,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: color ?? Colors.brown,
              brightness: Brightness.dark,
            ),
          ),
        );
      },
    );
  }
}
