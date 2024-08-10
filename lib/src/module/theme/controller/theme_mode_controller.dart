import 'package:flutter/material.dart';
import 'package:portfolio/src/module/theme/model/theme_mode_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theme_mode_controller.g.dart';

@Riverpod(keepAlive: true)
class ThemeModeController extends _$ThemeModeController {
  @override
  ThemeModeEntity build() {
    return ThemeModeEntity(
      themeMode: ThemeMode.system,
      name: 'name',
      id: 'id',
      vId: 'vId',
      type: 'type',
      createdAt: DateTime.now(),
      modifiedAt: DateTime.now(),
    );
  }

  void update(ThemeMode themeMode) {
    if (state.themeMode == themeMode) return;
    state = state.copyWith(themeMode: themeMode, modifiedAt: DateTime.now());
  }

  void darkMode() => update(ThemeMode.dark);

  void lightMode() => update(ThemeMode.light);

  void systemMode() => update(ThemeMode.system);
}
