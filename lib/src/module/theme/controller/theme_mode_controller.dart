import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:portfolio/src/module/theme/model/theme_mode_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theme_mode_controller.g.dart';

@riverpod
class ThemeModeController extends _$ThemeModeController {
  @override
  ThemeModeEntity build() {
    return ThemeModeEntity(
      themeMode: ThemeMode.system,
      modifiedAt: DateTime.now(),
      createdAt: DateTime.now(),
      id: 'theme_mode',
      name: 'Theme Mode',
      type: 'theme',
      vId: '1',
    );
  }

  ThemeModeEntity? update(ThemeMode themeMode) {
    if (state.themeMode == themeMode) return null;
    final prev = state;
    state = state.copyWith(themeMode: themeMode, modifiedAt: DateTime.now());
    return prev;
  }

  void darkMode() => update(ThemeMode.dark);

  void lightMode() => update(ThemeMode.light);

  void systemMode() => update(ThemeMode.system);

  void toggle() => KPlatform.isLight ? darkMode() : lightMode();
}
