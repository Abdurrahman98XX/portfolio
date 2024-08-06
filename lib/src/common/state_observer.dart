import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateObserver implements ProviderObserver {
  const StateObserver();
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    log('Initialized: $value', name: provider.name ?? '');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    log('Disposed', name: provider.name ?? '');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log(
      'Update: $previousValue ===> $newValue',
      name: provider.name ?? '',
    );
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    log(
      'Error',
      name: provider.name ?? '',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
