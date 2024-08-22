import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/module/theme/controller/auto_system_color_controller.dart';
import 'package:portfolio/src/module/theme/controller/color_source_controller.dart';
import 'package:portfolio/src/module/theme/controller/theme_mode_controller.dart';
import 'package:portfolio/src/module/theme/controller/user_color_controller.dart';
import 'package:portfolio/src/platform/app/android_app.dart';
import 'package:portfolio/src/platform/app/ios_app.dart';
import 'package:portfolio/src/platform/app/linux_app.dart';
import 'package:portfolio/src/platform/app/macos_app.dart';
import 'package:portfolio/src/platform/app/windows_app.dart';

class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({super.key, this.testPlatform});
  final TargetPlatform? testPlatform;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final watchThemeMode = ref.watch(themeModeControllerProvider);
        final watchColorSource = ref.watch(colorSourceControllerProvider);
        final watchAutoColor = ref.watch(autoSystemColorProvider());
        final watchUserColor = ref.watch(userColorControllerProvider);
        return switch (testPlatform ?? defaultTargetPlatform) {
          TargetPlatform.android => AndroidApp(themeMode: watchThemeMode.themeMode),
          TargetPlatform.iOS => IosApp(),
          TargetPlatform.linux => LinuxApp(),
          TargetPlatform.macOS => MacosApp(),
          TargetPlatform.windows => WindowsApp(),
          _ => throw 'who the fuck uses fuchsia',
        };
      },
    );
  }
}
