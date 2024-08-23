import 'dart:async';
import 'package:portfolio/src/base/base_entity.dart';

abstract class CacheApi {
  const CacheApi(this.provider);
  final dynamic provider;
  FutureOr<bool> remove(String key);
  FutureOr<bool> eraseDatabase();
  FutureOr<bool> exist(String key);
  FutureOr<JsonData?> get(String key);
  FutureOr<bool> set(String key, String value);
}

class CacheManager implements CacheApi {
  CacheManager();
  @override
  final SharedPreferencesAsync provider = SharedPreferencesAsync();

  @override
  bool remove(String key) => provider.delete(key);

  @override
  bool eraseDatabase() => provider.clear();

  @override
  Future<bool> exist(String key) => provider.containsKey(key);

  @override
  Future<JsonData?> get(String key) => provider.get(key);

  @override
  Future<bool> set(String key, JsonData value) => provider.put(key, value);
}
