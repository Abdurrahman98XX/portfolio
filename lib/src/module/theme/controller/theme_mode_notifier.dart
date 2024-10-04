import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/common/platform.dart';
import 'package:portfolio/src/module/theme/model/theme_mode_entity.dart';

class ThemeModeNotifier extends Notifier<ThemeModeEntity> {
  static final provider = NotifierProvider<ThemeModeNotifier, ThemeModeEntity>(
    ThemeModeNotifier.new,
    name: 'ThemeModeNotifier',
  );
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
