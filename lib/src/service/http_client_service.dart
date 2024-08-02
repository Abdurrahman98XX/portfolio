import 'dart:developer';
import 'dart:io';
import 'package:cronet_http/cronet_http.dart';
import 'package:cupertino_http/cupertino_http.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class HttpClientService {
  static const _maxCacheSize = 2 * 1024 * 1024;

  static Client get() {
    try {
      if (!kIsWeb) {
        if (Platform.isIOS || Platform.isMacOS) {
          return CupertinoClient.fromSessionConfiguration(
            URLSessionConfiguration.ephemeralSessionConfiguration()
              ..cache = URLCache.withCapacity(memoryCapacity: _maxCacheSize)
              ..allowsCellularAccess = true,
          );
        }
        //
        if (Platform.isAndroid) {
          return CronetClient.fromCronetEngine(
            CronetEngine.build(
              cacheMode: CacheMode.memory,
              cacheMaxSize: _maxCacheSize,
              enableHttp2: true,
            ),
            closeEngine: true,
          );
        }
      }
    } catch (error) {
      // TODO log
      log('$error');
    }
    // TODO delete
    if (kDebugMode) print('DEFAULT !!!!!!!!!!!!!!');
    return Client();
  }
}
