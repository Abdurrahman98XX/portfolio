import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:portfolio/src/localization/localization.dart';
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
    return Consumer(
      builder: (context, ref, child) {
        final watchThemeMode = ref.watch(themeModeControllerProvider);
        // final watchColorSource = ref.watch(colorSourceControllerProvider);
        // final watchAutoColor = ref.watch(autoSystemColorProvider());
        // final watchUserColor = ref.watch(userColorControllerProvider);
        return switch (testPlatform ?? defaultTargetPlatform) {
          TargetPlatform.android => AndroidApp(
              themeMode: watchThemeMode.themeMode,
              routeInformationParser:
                  ServiceLocator.router.routeInformationParser,
              routeInformationProvider:
                  ServiceLocator.router.routeInformationProvider,
              routerDelegate: ServiceLocator.router.routerDelegate,
              backButtonDispatcher: ServiceLocator.router.backButtonDispatcher,
              supportedLocales: AppLocalizations.supportedLocales,
              onGenerateTitle: Global.onGenerateTitle,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              restorationScopeId: Global.appId,
            ),
          TargetPlatform.iOS => IosApp(
              themeMode: watchThemeMode.themeMode,
              routeInformationParser:
                  ServiceLocator.router.routeInformationParser,
              routeInformationProvider:
                  ServiceLocator.router.routeInformationProvider,
              routerDelegate: ServiceLocator.router.routerDelegate,
              supportedLocales: AppLocalizations.supportedLocales,
              backButtonDispatcher: ServiceLocator.router.backButtonDispatcher,
              onGenerateTitle: Global.onGenerateTitle,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              restorationScopeId: Global.appId,
            ),
          TargetPlatform.linux => LinuxApp(
              child: AndroidApp(
                themeMode: watchThemeMode.themeMode,
                routeInformationParser:
                    ServiceLocator.router.routeInformationParser,
                routeInformationProvider:
                    ServiceLocator.router.routeInformationProvider,
                supportedLocales: AppLocalizations.supportedLocales,
                routerDelegate: ServiceLocator.router.routerDelegate,
                backButtonDispatcher:
                    ServiceLocator.router.backButtonDispatcher,
                onGenerateTitle: Global.onGenerateTitle,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                restorationScopeId: Global.appId,
              ),
            ),
          TargetPlatform.macOS => MacosApp(
              themeMode: watchThemeMode.themeMode,
              routeInformationParser:
                  ServiceLocator.router.routeInformationParser,
              supportedLocales: AppLocalizations.supportedLocales,
              routeInformationProvider:
                  ServiceLocator.router.routeInformationProvider,
              routerDelegate: ServiceLocator.router.routerDelegate,
              backButtonDispatcher: ServiceLocator.router.backButtonDispatcher,
              onGenerateTitle: Global.onGenerateTitle,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              restorationScopeId: Global.appId,
            ),
          TargetPlatform.windows => WindowsApp(
              themeMode: watchThemeMode.themeMode,
              supportedLocales: AppLocalizations.supportedLocales,
              routeInformationParser:
                  ServiceLocator.router.routeInformationParser,
              routeInformationProvider:
                  ServiceLocator.router.routeInformationProvider,
              routerDelegate: ServiceLocator.router.routerDelegate,
              backButtonDispatcher: ServiceLocator.router.backButtonDispatcher,
              onGenerateTitle: Global.onGenerateTitle,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              restorationScopeId: Global.appId,
            ),
          _ => throw 'who the fuck uses fuchsia',
        };
      },
    );
  }
}
