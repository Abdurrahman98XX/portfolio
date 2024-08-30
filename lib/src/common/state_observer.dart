import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateObserver implements ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    log('Started\n' 'Init value:\n$value', name: provider.name ?? 'Null');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    log('Closed\n', name: provider.name ?? 'Null');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log(
      'Updated\n'
      'Prev value:\n$previousValue\n'
      'New value:\n$newValue',
      name: provider.name ?? 'Null',
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
      'Failed\n',
      name: provider.name ?? 'Null',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
