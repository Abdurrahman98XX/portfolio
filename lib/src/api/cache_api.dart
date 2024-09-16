// ignore_for_file: unused_catch_stack

import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:portfolio/src/entity/base_entity.dart';
import 'package:portfolio/src/service/service_locator.dart';

abstract class CacheApi<P> {
  const CacheApi(this.provider);

  final P provider;
  FutureOr<bool> remove(String key);
  FutureOr<bool> eraseDatabase();
  FutureOr<bool> exist(String key);
  FutureOr<T?> get<T>(String key, T Function(JsonData json) fromJson);
  FutureOr<bool> set(String key, JsonData value);
}

class CacheManager extends CacheApi<FlutterSecureStorage> {
  const CacheManager(super.provider);

  @override
  Future<bool> remove(String key) async {
    try {
      await provider.delete(key: key);
      return true;
    } catch (e, st) {
      return false;
    }
  }

  @override
  Future<bool> eraseDatabase() async {
    try {
      await provider.deleteAll();
      return true;
    } catch (e, st) {
      return false;
    }
  }

  @override
  Future<bool> exist(String key) => provider.containsKey(key: key);

  @override
  Future<T?> get<T>(String key, T Function(JsonData json) fromJson) async {
    try {
      final cache = await provider.read(key: key);
      return await ServiceLocator.worker.send(
        () => cache != null ? fromJson(jsonDecode(cache)) : null,
      );
    } catch (e, st) {
      return null;
    }
  }

  @override
  Future<bool> set(String key, JsonData value) async {
    try {
      await provider.write(key: key, value: value.toString());
      return true;
    } catch (e, st) {
      return false;
    }
  }
}
