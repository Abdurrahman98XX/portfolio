import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/service/service_locator.dart';

final connectionProvider = StreamProvider<List<ConnectivityResult>>(
  name: 'connectionProvider',
  (ref) => ServiceLocator.connection.onConnectivityChanged,
);

final _isConnectedProvider = FutureProvider<bool>(
  name: 'isConnectedProvider',
  (ref) async => ref.watch(connectionProvider.future
      .select((s) async => (await s)[0] != ConnectivityResult.none)),
);

final webReachableProvider = FutureProvider<bool>(
  name: 'reachabilityProvider',
  (ref) async {
    // TODO: show a snackbar
    if (await ref.watch(_isConnectedProvider.future)) {
      final result = [for (var url in _urls) await InternetAddress.lookup(url)];
      for (var url in result) {
        if (url.isNotEmpty && url[0].rawAddress.isNotEmpty) return true;
      }
    }
    return false;
  },
);

final internetCheckProvider = FutureProvider<bool>(
  name: 'internetCheckProvider',
  (ref) async {
    final isCon = await ref.watch(_isConnectedProvider.future);
    var isRea = await ref.watch(webReachableProvider.future);
    if (isCon && isRea) {
      ref.read(firstInternetConnectionProvider.notifier).state = true;
      return true;
    }
    return false;
  },
);

final firstInternetConnectionProvider = StateProvider<bool>(
  name: 'internetConnectedForFirstTimeProvider',
  (ref) => false,
);

const _urls = [
  'http://NeverSSL.com',
  'http://example.com',
  'http://google.com',
];
