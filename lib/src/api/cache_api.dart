// ignore_for_file: unused_catch_stack
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:portfolio/src/entity/base_entity.dart';
import 'package:portfolio/src/entity/cache_keys_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:portfolio/src/service/service_locator.dart';

abstract class CacheApi<P> {
  const CacheApi(this.provider);

  final P provider;
  FutureOr<bool> eraseDatabase();
  FutureOr<bool> exist(CacheKeyEntity key);
  FutureOr<bool> remove(CacheKeyEntity key);
  FutureOr<bool> set(CacheKeyEntity key, JsonData value);
  FutureOr<T?> get<T>(CacheKeyEntity key, T Function(JsonData json) fromJson);
}

class CacheManager extends CacheApi<SharedPreferencesAsync> {
  const CacheManager(super.provider);

  @override
  Future<bool> remove(CacheKeyEntity key) async {
    await provider.remove(key.name);
    return true;
  }

  @override
  Future<bool> eraseDatabase() async {
    await provider.clear();
    return true;
  }

  @override
  Future<bool> exist(CacheKeyEntity key) async =>
      provider.containsKey(key.name);

  @override
  Future<T?> get<T>(
      CacheKeyEntity key, T Function(JsonData json) fromJson) async {
    try {
      final cache = await provider.getString(key.name);
      return (cache == null || cache.isEmpty)
          ? null
          : ServiceLocator.worker.send(() => fromJson(jsonDecode(cache)));
    } catch (e, st) {
      log('Error', name: '$runtimeType', error: e, stackTrace: st);
      return null;
    }
  }

  @override
  Future<bool> set(CacheKeyEntity key, JsonData value) async {
    await provider.setString(key.name, '$value');
    return true;
  }
}
