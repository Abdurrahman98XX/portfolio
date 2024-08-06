// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cronet_http/cronet_http.dart';
import 'package:cupertino_http/cupertino_http.dart';
import 'package:fetch_client/fetch_client.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:portfolio/src/common/const.dart';

Client Function() service() {
  try {
    if (Const.isWeb) return _BrowserHttpClient.new;
    if (Platform.isAndroid) return _AndroidHttpClient.new;
    if (Platform.isIOS || Platform.isMacOS) return _CupertinoHttpClient.new;
  } catch (error) {
    // TODO log
    log('$error');
  }
  return Client.new;
}

class _HttpClient implements BaseClient {
  const _HttpClient(this.provider);
  final Client provider;
  static const _maxCache = 1024 * 1024 * 3;

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return provider.send(request);
  }

  @override
  void close() {
    return provider.close();
  }

  @override
  Future<Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return provider.delete(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) {
    return provider.get(url, headers: headers);
  }

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) {
    return provider.head(url, headers: headers);
  }

  @override
  Future<Response> patch(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return provider.patch(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  @override
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return provider.post(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  @override
  Future<Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return provider.put(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) {
    return provider.read(url, headers: headers);
  }

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) {
    return provider.readBytes(url, headers: headers);
  }
}

class _AndroidHttpClient extends _HttpClient {
  factory _AndroidHttpClient() => _i;
  const _AndroidHttpClient._(super.provider);
  static final _i = _AndroidHttpClient._(
    CronetClient.fromCronetEngine(
      CronetEngine.build(
        enableHttp2: true,
        cacheMode: CacheMode.memory,
        cacheMaxSize: _HttpClient._maxCache,
      ),
      closeEngine: true,
    ),
  );
}

class _CupertinoHttpClient extends _HttpClient {
  factory _CupertinoHttpClient() => _i;
  const _CupertinoHttpClient._(super.provider);
  static final _i = _CupertinoHttpClient._(
    CupertinoClient.fromSessionConfiguration(
      URLSessionConfiguration.ephemeralSessionConfiguration()
        ..cache = URLCache.withCapacity(
          memoryCapacity: _HttpClient._maxCache,
        )
        ..allowsCellularAccess = true,
    ),
  );
}

class _BrowserHttpClient extends _HttpClient {
  factory _BrowserHttpClient() => _i;
  const _BrowserHttpClient._(super.provider);
  static final _i = _BrowserHttpClient._(FetchClient());
}
