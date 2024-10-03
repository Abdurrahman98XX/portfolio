import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/module/theme/controller/color_source_notifier.dart';
import 'package:system_theme/system_theme.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:portfolio/src/entity/base_entity.dart';

final autoSystemColorProvider = StreamProvider.family<Color, bool>(
  name: 'autoSystemColorProvider',
  (ref, listenColorChange) async* {
    final autoColorAbilityWatcher = ref.watch(autoSystemColorAbilityProvider);
    final colorSourceWatcher = ref.watch(
      ColorSourceNotifier.provider.select((c) => c.eWho != WHO.user),
    );
    if (autoColorAbilityWatcher && colorSourceWatcher) {
      if (KPlatform.isWindows) {
        yield* SystemTheme.onChange.map((c) => c.accent);
      } else {
        await SystemTheme.accentColor.load();
        var old = SystemTheme.accentColor.accent;
        yield old;
        while (listenColorChange || kDebugMode) {
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
  },
);

final autoSystemColorAbilityProvider = Provider<bool>(
  name: 'autoSystemColorAbilityProvider',
  (ref) => SystemTheme.accentColor.accent != SystemTheme.fallbackColor,
);
