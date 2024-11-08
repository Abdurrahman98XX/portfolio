import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:portfolio/src/localization/localization.dart';
import 'package:portfolio/src/module/router/controller/router.dart';
import 'package:portfolio/src/module/theme/controller/theme_mode_notifier.dart';
import 'package:portfolio/src/platform/app/android_app.dart';
import 'package:portfolio/src/platform/app/ios_app.dart';
import 'package:portfolio/src/platform/app/linux_app.dart';
import 'package:portfolio/src/platform/app/macos_app.dart';
import 'package:portfolio/src/platform/app/windows_app.dart';
import 'package:portfolio/src/service/wakeup_provider.dart';

abstract class AppInterface extends StatelessWidget {
  AppInterface({super.key, required this.ref});
  final WidgetRef ref;
  final theme = ThemeData();
  final darkTheme = ThemeData.dark();
  final restorationScopeId = Global.appId;
  final onGenerateTitle = Global.onGenerateTitle;
  final actions = {...WidgetsApp.defaultActions};
  late final routerConfig = ref.watch(routerProvider);
  final shortcuts = {...WidgetsApp.defaultShortcuts};
  late final locale = ref.watch(localizationProvider);
  final scaffoldMessengerKey = Global.scaffoldMessengerKey;
  final supportedLocales = AppLocalizations.supportedLocales;
  late final themeMode = ref.watch(ThemeModeNotifier.provider).themeMode;
  final localizationsDelegates = AppLocalizations.localizationsDelegates;
}

class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      key: key,
      builder: (context, ref, child) {
        ref.read(wakeUpProvider);
        return switch (defaultTargetPlatform) {
          TargetPlatform.iOS => IosApp(ref: ref),
          TargetPlatform.macOS => MacosApp(ref: ref),
          TargetPlatform.android => AndroidApp(ref: ref),
          TargetPlatform.windows => WindowsApp(ref: ref),
          TargetPlatform.linux =>
            LinuxApp(ref: ref, child: AndroidApp(ref: ref)),
          _ => throw Exception('Unsupported Platform'),
        };
      },
    );
  }
}
