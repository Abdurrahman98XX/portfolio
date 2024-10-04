import 'dart:developer';
import 'package:http/http.dart';
import 'package:cronet_http/cronet_http.dart';
import 'package:fetch_client/fetch_client.dart';
import 'package:cupertino_http/cupertino_http.dart';
import 'package:portfolio/src/common/platform.dart';

class KClient extends BaseClient {
  KClient(this.provider);

  final Client provider;
  static const _maxCache = 1024 * 1024 * 3;

  static Client Function() service() {
    if (KPlatform.isBrowser) return _BrowserHttpClient.new;
    if (KPlatform.isAndroid) return _AndroidHttpClient.new;
    if (KPlatform.isApple) return _CupertinoHttpClient.new;
    return _NormaHttpClient.new;
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    log(
      'url: ${request.url}\n'
      'method: ${request.method}\n'
      'finalized: ${request.finalized}\n'
      'maxRedirects: ${request.maxRedirects}\n'
      'contentLength: ${request.contentLength}\n'
      'followRedirects: ${request.followRedirects}\n'
      'persistentConnection: ${request.persistentConnection}\n\n'
      'Headers: ${request.headers}\n',
      name: '$runtimeType',
      time: DateTime.now(),
    );
    return provider.send(request);
  }

  @override
  void close() => provider.close();
}

class _AndroidHttpClient extends KClient {
  factory _AndroidHttpClient() => _i!;
  _AndroidHttpClient._(super.client);
  static final _i = KPlatform.isAndroid
      ? _AndroidHttpClient._(
          CronetClient.fromCronetEngine(
            CronetEngine.build(
              enableHttp2: true,
              cacheMode: CacheMode.memory,
              cacheMaxSize: KClient._maxCache,
              enableBrotli: true,
              enableQuic: true,
            ),
            closeEngine: true,
          ),
        )
      : null;
}

class _CupertinoHttpClient extends KClient {
  factory _CupertinoHttpClient() => _i!;
  _CupertinoHttpClient._(super.provider);
  static final _i = KPlatform.isApple
      ? _CupertinoHttpClient._(
          CupertinoClient.fromSessionConfiguration(
            URLSessionConfiguration.ephemeralSessionConfiguration()
              ..cache = URLCache.withCapacity(
                memoryCapacity: KClient._maxCache,
              )
              ..allowsCellularAccess = true,
          ),
        )
      : null;
}

class _BrowserHttpClient extends KClient {
  factory _BrowserHttpClient() => _i!;
  _BrowserHttpClient._(super.provider);
  static final _i = KPlatform.isBrowser
      ? _BrowserHttpClient._(FetchClient(streamRequests: true))
      : null;
}

class _NormaHttpClient extends KClient {
  factory _NormaHttpClient() => _i;
  _NormaHttpClient._(super.provider);
  static final _i = _NormaHttpClient._(Client());
}
