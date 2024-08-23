import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/module/theme/controller/theme_mode_controller.dart';
import 'package:portfolio/src/platform/app/android_app.dart';
import 'package:portfolio/src/platform/app/ios_app.dart';
import 'package:portfolio/src/platform/app/linux_app.dart';
import 'package:portfolio/src/platform/app/macos_app.dart';
import 'package:portfolio/src/platform/app/windows_app.dart';
import 'package:portfolio/src/service/service_locator.dart';

class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({super.key, this.testPlatform});
  final TargetPlatform? testPlatform;
  @override
  Widget build(BuildContext context) {
    final router = ServiceLocator.router;
    return Consumer(
      builder: (context, ref, child) {
        final watchThemeMode = ref.watch(themeModeControllerProvider);
        // final watchColorSource = ref.watch(colorSourceControllerProvider);
        // final watchAutoColor = ref.watch(autoSystemColorProvider());
        // final watchUserColor = ref.watch(userColorControllerProvider);
        return switch (testPlatform ?? defaultTargetPlatform) {
          TargetPlatform.android => AndroidApp(
              themeMode: watchThemeMode.themeMode,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              routerDelegate: router.routerDelegate,
              backButtonDispatcher: router.backButtonDispatcher,
            ),
          TargetPlatform.iOS => IosApp(
              themeMode: watchThemeMode.themeMode,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              routerDelegate: router.routerDelegate,
              backButtonDispatcher: router.backButtonDispatcher,
            ),
          TargetPlatform.linux => LinuxApp(
              child: AndroidApp(
                themeMode: watchThemeMode.themeMode,
                routeInformationParser: router.routeInformationParser,
                routeInformationProvider: router.routeInformationProvider,
                routerDelegate: router.routerDelegate,
                backButtonDispatcher: router.backButtonDispatcher,
              ),
            ),
          TargetPlatform.macOS => MacosApp(
              themeMode: watchThemeMode.themeMode,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              routerDelegate: router.routerDelegate,
              backButtonDispatcher: router.backButtonDispatcher,
            ),
          TargetPlatform.windows => WindowsApp(
              themeMode: watchThemeMode.themeMode,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              routerDelegate: router.routerDelegate,
              backButtonDispatcher: router.backButtonDispatcher,
            ),
          _ => throw 'who the fuck uses fuchsia',
        };
      },
    );
  }
}
