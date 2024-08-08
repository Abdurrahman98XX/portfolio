import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:portfolio/src/common/const.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:system_theme/system_theme.dart';
part 'system_color_controller.g.dart';

@Riverpod(keepAlive: true)
Stream<Color> systemColorRefrsher(SystemColorRefrsherRef ref) async* {
  if (ref.watch(systemColorAbilityProvider)) {
    var old = SystemTheme.accentColor.accent;
    yield old;
    yield* _systemColorRefrsher().where(
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

Stream<Color> _systemColorRefrsher({int millis = 250}) async* {
  while (true) {
    if (Platform.isWindows && !Const.isWeb) {
      yield* SystemTheme.onChange.cast<Color>();
    } else {
      yield SystemTheme.accentColor.accent;
      await SystemTheme.accentColor.load();
      await Future.delayed(Duration(milliseconds: millis));
    }
  }
}

@Riverpod(keepAlive: true)
bool systemColorAbility(SystemColorAbilityRef ref) {
  return SystemTheme.accentColor.accent != SystemTheme.fallbackColor;
}
