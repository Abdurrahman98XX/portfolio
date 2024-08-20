import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/service/service_locator.dart';

class StateObserver implements ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    ServiceLocator.logger.i('${provider.name} Started\n' 'Init value:\n$value');
  }

  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    ServiceLocator.logger.d('${provider.name} Closed\n');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    ServiceLocator.logger.i(
      '${provider.name} Updated\n'
      'Prev value:\n$previousValue\n'
      'New value:\n$newValue',
    );
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    ServiceLocator.logger.e(
      '${provider.name} Failed\n',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
