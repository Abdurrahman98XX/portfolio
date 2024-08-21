import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/src/platform/app/android_app.dart';
import 'package:portfolio/src/platform/app/ios_app.dart';
import 'package:portfolio/src/platform/app/linux_app.dart';
import 'package:portfolio/src/platform/app/macos_app.dart';
import 'package:portfolio/src/platform/app/windows_app.dart';

class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({super.key});
  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => const AndroidApp(),
      TargetPlatform.iOS => const IosApp(),
      TargetPlatform.linux => const LinuxApp(),
      TargetPlatform.macOS => const MacosApp(),
      TargetPlatform.windows => const WindowsApp(),
      _ => throw '',
    };
  }
}
