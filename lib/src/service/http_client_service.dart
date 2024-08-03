// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cronet_http/cronet_http.dart';
import 'package:cupertino_http/cupertino_http.dart';
import 'package:fetch_client/fetch_client.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class HttpClient implements BaseClient {
  const HttpClient(this.provider);
  final Client provider;
  static const _maxCache = 1024 * 1024 * 3;
  static Client Function() service() {
    try {
      if (kIsWeb) return BrowserHttpClient.new;
      if (Platform.isAndroid) return AndroidHttpClient.new;
      if (Platform.isIOS || Platform.isMacOS) return CupertinoHttpClient.new;
    } catch (error) {
      // TODO log
      log('$error');
    }
    return Client.new;
  }

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

class AndroidHttpClient extends HttpClient {
  factory AndroidHttpClient() => _i;
  const AndroidHttpClient._(super.provider);
  static final _i = AndroidHttpClient._(
    CronetClient.fromCronetEngine(
      CronetEngine.build(
        enableHttp2: true,
        cacheMode: CacheMode.memory,
        cacheMaxSize: HttpClient._maxCache,
      ),
      closeEngine: true,
    ),
  );
}

class CupertinoHttpClient extends HttpClient {
  factory CupertinoHttpClient() => _i;
  const CupertinoHttpClient._(super.provider);
  static final _i = CupertinoHttpClient._(
    CupertinoClient.fromSessionConfiguration(
      URLSessionConfiguration.ephemeralSessionConfiguration()
        ..cache = URLCache.withCapacity(
          memoryCapacity: HttpClient._maxCache,
        )
        ..allowsCellularAccess = true,
    ),
  );
}

class BrowserHttpClient extends HttpClient {
  factory BrowserHttpClient() => _i;
  const BrowserHttpClient._(super.provider);
  static final _i = BrowserHttpClient._(FetchClient());
}
