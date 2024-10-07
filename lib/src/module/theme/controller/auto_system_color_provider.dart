import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/common/platform.dart';
import 'package:portfolio/src/module/theme/controller/app_color_notifier.dart';
import 'package:system_theme/system_theme.dart';
import 'package:portfolio/src/entity/base_entity.dart';

final autoSystemColorProvider = StreamProvider.family<Color, bool>(
  name: 'autoSystemColorProvider',
  (ref, listenColorChange) async* {
    final autoColorAbilityWatcher = ref.watch(autoSystemColorAbilityProvider);
    final colorSourceWatcher = ref.watch(AppColorNotifier.provider.select(
      (c) => c.valueOrNull?.who.whoEnum != WHOEnum.user,
    ));
    if (autoColorAbilityWatcher && colorSourceWatcher) {
      if (KPlatform.isWindows) {
        yield* SystemTheme.onChange.map((c) => c.accent);
      } else {
        var old = SystemTheme.accentColor.accent;
        await SystemTheme.accentColor.load();
        yield old;
        while (listenColorChange || kDebugMode) {
          await Future<void>.delayed(const Duration(seconds: 1));
          await SystemTheme.accentColor.load();
          final color = SystemTheme.accentColor.accent;
          if (color.value != old.value) {
            old = color;
            yield old;
          }
        }
      }
    }
  },
);

final autoSystemColorAbilityProvider = Provider<bool>(
  name: 'autoSystemColorAbilityProvider',
  (ref) => SystemTheme.accentColor.accent != SystemTheme.fallbackColor,
);
