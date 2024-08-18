import 'dart:async';
import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';
import 'package:portfolio/src/common/const.dart';
import 'package:portfolio/src/module/base/base_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:portfolio/src/module/theme/controller/color_source_controller.dart';
part 'auto_system_color_controller.g.dart';

@riverpod
Stream<Color> autoSystemColor(AutoSystemColorRef ref) async* {
  final autoColorAbilityWatcher = ref.watch(autoSystemColorAbilityProvider);
  final colorSourceWatcher =
      ref.watch(colorSourceControllerProvider).source == Source.system;
  if (autoColorAbilityWatcher && colorSourceWatcher) {
    if (KPlatform.isWindows) yield* SystemTheme.onChange.map((c) => c.accent);
    var old = SystemTheme.accentColor.accent;
    yield old;
    while (true) {
      await SystemTheme.accentColor.load();
      await Future.delayed(const Duration(milliseconds: 250));
      final color = SystemTheme.accentColor.accent;
      if (color.value != old.value) {
        old = color;
        yield old;
      }
    }
  }
}

@riverpod
bool autoSystemColorAbility(AutoSystemColorAbilityRef ref) {
  return SystemTheme.accentColor.accent != SystemTheme.fallbackColor;
}
