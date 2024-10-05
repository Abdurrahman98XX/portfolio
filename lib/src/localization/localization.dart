import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';
export 'package:flutter_localizations/flutter_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

final languageStateProvider = StateProvider<String?>(
  (ref) => null,
  name: 'languageStateProvider',
);

final localizationProvider = Provider<Locale?>(
  name: 'localizationProvider',
  (ref) {
    try {
      return AppLocalizations.supportedLocales.firstWhere(
        (locale) => locale.languageCode == ref.watch(languageStateProvider),
      );
    } catch (e) {
      return null;
    }
  },
);
