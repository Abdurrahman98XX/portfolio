import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:portfolio/src/localization/localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/service/k_device_info.dart';
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
        final color = ref.watch(autoSystemColorProvider()).value;
        final preBack =
            (ref.read(deviceInfoProvider) as AndroidDeviceInfo).version.sdkInt > 33;
        return MaterialApp.router(
          themeMode: themeMode,
          restorationScopeId: Global.appId,
          onGenerateTitle: Global.onGenerateTitle,
          localizationsDelegates: Global.localizations,
          scaffoldMessengerKey: Global.scaffoldMessengerKey,
          supportedLocales: AppLocalizations.supportedLocales,
          routerDelegate: ServiceLocator.router.routerDelegate,
          backButtonDispatcher: ServiceLocator.router.backButtonDispatcher,
          routeInformationParser: ServiceLocator.router.routeInformationParser,
          routeInformationProvider: ServiceLocator.router.routeInformationProvider,
          theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                if (preBack)
                  TargetPlatform.android: const PredictiveBackPageTransitionsBuilder(),
              },
            ),
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: color ?? Colors.brown,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                if (preBack)
                  TargetPlatform.android: const PredictiveBackPageTransitionsBuilder(),
              },
            ),
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
