import 'dart:async';
import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';
import 'package:portfolio/src/common/const.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auto_system_color_controller.g.dart';

@Riverpod(keepAlive: true)
Stream<Color> autoSystemColor(AutoSystemColorRef ref) async* {
  if (ref.watch(autoSystemColorAbilityProvider)) {
    var old = SystemTheme.accentColor.accent;
    yield old;
    yield* _autoSystemColor().where(
      (color) {
        if (color.value != old.value) {
          old = color;
          return true;
        }
        return false;
      },
    );
  }
}

Stream<Color> _autoSystemColor({int millis = 250}) async* {
  while (true) {
    if (KPlatform.isWindows) {
      yield* SystemTheme.onChange.map((c) => c.accent);
    } else {
      yield SystemTheme.accentColor.accent;
      await SystemTheme.accentColor.load();
      await Future.delayed(Duration(milliseconds: millis));
    }
  }
}

@Riverpod(keepAlive: true)
bool autoSystemColorAbility(AutoSystemColorAbilityRef ref) {
  return SystemTheme.accentColor.accent != SystemTheme.fallbackColor;
}
