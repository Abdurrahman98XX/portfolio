import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateObserver implements ProviderObserver {
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    log(
      'Provider started 🆙: $value',
      name: '${provider.name}',
      time: DateTime.now(),
    );
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    log('Provider closed ❌', name: '${provider.name}', time: DateTime.now());
  }

  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? was,
      Object? now, ProviderContainer container) {
    log(
      'Provider updated: ♻️\nwas: $was\nnow: $now',
      name: '${provider.name}',
      time: DateTime.now(),
    );
  }

  @override
  void providerDidFail(ProviderBase<Object?> provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    log(
      'Provider error 🚫',
      name: '${provider.name}',
      time: DateTime.now(),
      stackTrace: stackTrace,
      error: error,
    );
  }
}
