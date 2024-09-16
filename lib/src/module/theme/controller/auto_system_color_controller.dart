import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:portfolio/src/entity/base_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:portfolio/src/module/theme/controller/color_source_controller.dart';
part 'auto_system_color_controller.g.dart';

@riverpod
Stream<Color> autoSystemColor(
  AutoSystemColorRef ref, {
  bool listenSystemColorChange = false,
}) async* {
  final autoColorAbilityWatcher = ref.watch(autoSystemColorAbilityProvider);
  final colorSourceWatcher =
      ref.watch(colorSourceControllerProvider).eWho != WHO.user;
  if (autoColorAbilityWatcher && colorSourceWatcher) {
    if (KPlatform.isWindows) {
      yield* SystemTheme.onChange.map((c) => c.accent);
    } else {
      await SystemTheme.accentColor.load();
      var old = SystemTheme.accentColor.accent;
      yield old;
      while (listenSystemColorChange || kDebugMode) {
        await Future.delayed(const Duration(seconds: 1));
        await SystemTheme.accentColor.load();
        final color = SystemTheme.accentColor.accent;
        if (color.value != old.value) {
          old = color;
          yield old;
        }
      }
    }
  }
}

@riverpod
bool autoSystemColorAbility(AutoSystemColorAbilityRef ref) {
  return SystemTheme.accentColor.accent != SystemTheme.fallbackColor;
}
