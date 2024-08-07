import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:system_theme/system_theme.dart';
part 'system_color_controller.g.dart';

@Riverpod(keepAlive: true)
Stream<Color> systemColorRefrsher(SystemColorRefrsherRef ref) async* {
  if (Platform.isWindows) {
    yield* SystemTheme.onChange.cast<Color>();
  } else {
    final prev = SystemTheme.accentColor.accent.value;
    await Future.delayed(const Duration(milliseconds: 100));
    await SystemTheme.accentColor.load();
    if (prev != SystemTheme.accentColor.accent.value) {
      yield SystemTheme.accentColor.accent;
    }
  }
}

@Riverpod(keepAlive: true)
bool systemColorAbility(SystemColorAbilityRef ref) {
  return SystemTheme.accentColor.accent == SystemTheme.fallbackColor;
}
