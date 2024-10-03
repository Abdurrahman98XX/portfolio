// ignore_for_file: unused_catch_stack
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:portfolio/src/entity/base_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class CacheManager extends CacheApi<SharedPreferencesAsync> {
  const CacheManager(super.provider);

  @override
  Future<bool> remove(String key) => handleAsync(() => provider.remove(key));

  @override
  Future<bool> eraseDatabase() => handleAsync(() => provider.clear());

  @override
  Future<bool> exist(String key) =>
      handleAsync(() => provider.containsKey(key));

  @override
  Future<T?> get<T>(String key, T Function(JsonData json) fromJson) async {
    try {
      final cache = await provider.getString(key);
      return cache == null
          ? null
          : ServiceLocator.worker.send(() => fromJson(jsonDecode(cache)));
    } catch (e, st) {
      log('Error', name: '$runtimeType', error: e, stackTrace: st);
      return null;
    }
  }

  @override
  Future<bool> set(String key, JsonData value) =>
      handleAsync(() => provider.setString(key, value.toString()));

  Future<bool> handleAsync(Future Function() fun) async {
    try {
      if (fun is Future<bool> Function()) return await fun();
      await fun();
      return true;
    } catch (e, st) {
      log('Error', name: '$runtimeType', error: e, stackTrace: st);
      return false;
    }
  }
}
