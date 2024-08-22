import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/src/platform/{{{name.snakeCase()}}}/android_{{{name.snakeCase()}}}.dart';
import 'package:portfolio/src/platform/{{{name.snakeCase()}}}/ios_{{{name.snakeCase()}}}.dart';
import 'package:portfolio/src/platform/{{{name.snakeCase()}}}/linux_{{{name.snakeCase()}}}.dart';
import 'package:portfolio/src/platform/{{{name.snakeCase()}}}/macos_{{{name.snakeCase()}}}.dart';
import 'package:portfolio/src/platform/{{{name.snakeCase()}}}/windows_{{{name.snakeCase()}}}.dart';

class Adaptive{{{name.pascalCase()}}} extends StatelessWidget {
  const Adaptive{{{name.pascalCase()}}}({super.key, this.testPlatform});
  final TargetPlatform? testPlatform;
  @override
  Widget build(BuildContext context) {
    return switch (testPlatform ?? defaultTargetPlatform) {
      TargetPlatform.android => const Android{{{name.pascalCase()}}}(),
      TargetPlatform.iOS => const Ios{{{name.pascalCase()}}}(),
      TargetPlatform.linux => const Linux{{{name.pascalCase()}}}(),
      TargetPlatform.macOS => const Macos{{{name.pascalCase()}}}(),
      TargetPlatform.windows => const Windows{{{name.pascalCase()}}}(),
      _ => throw 'who the fuck uses fuchsia',
    };
  }
}
