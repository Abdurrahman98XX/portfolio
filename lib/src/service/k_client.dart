import 'package:http/http.dart';
import 'package:cronet_http/cronet_http.dart';
import 'package:fetch_client/fetch_client.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:cupertino_http/cupertino_http.dart';

abstract class KClient with BaseClient {
  const KClient(this.provider);
  final Client provider;
  static const _maxCache = 1024 * 1024 * 3;
  static Client Function() service() {
    if (KPlatform.isBrowser) return _BrowserHttpClient.new;
    if (KPlatform.isAndroid) return _AndroidHttpClient.new;
    if (KPlatform.isIOS || KPlatform.isMacOS) return _CupertinoHttpClient.new;
    return Client.new;
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) => provider.send(request);

  @override
  void close() => provider.close();
}

class _AndroidHttpClient extends KClient {
  factory _AndroidHttpClient() => _i;
  const _AndroidHttpClient._(super.client);
  static final _i = _AndroidHttpClient._(
    CronetClient.fromCronetEngine(
      CronetEngine.build(
        enableHttp2: true,
        cacheMode: CacheMode.memory,
        cacheMaxSize: KClient._maxCache,
      ),
      closeEngine: true,
    ),
  );
}

class _CupertinoHttpClient extends KClient {
  factory _CupertinoHttpClient() => _i;
  const _CupertinoHttpClient._(super.provider);
  static final _i = _CupertinoHttpClient._(
    CupertinoClient.fromSessionConfiguration(
      URLSessionConfiguration.ephemeralSessionConfiguration()
        ..cache = URLCache.withCapacity(
          memoryCapacity: KClient._maxCache,
        )
        ..allowsCellularAccess = true,
    ),
  );
}

class _BrowserHttpClient extends KClient {
  factory _BrowserHttpClient() => _i;
  const _BrowserHttpClient._(super.provider);
  static final _i = _BrowserHttpClient._(FetchClient());
}