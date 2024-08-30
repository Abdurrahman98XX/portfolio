import 'dart:async';
import 'package:portfolio/src/base/base_entity.dart';

abstract class CacheApi<P> {
  const CacheApi(this.provider);

  final dynamic provider;
  FutureOr<bool> remove(String key);
  FutureOr<bool> eraseDatabase();
  FutureOr<bool> exist(String key);
  FutureOr<JsonData?> get(String key);
  FutureOr<bool> set(String key, JsonData value);
}

class CacheManager extends CacheApi {
  const CacheManager(super.provider);

  @override
  Future<bool> remove(String key) async {
     return  await provider.delete(key: key);
  }

  @override
  bool eraseDatabase() {
    return provider.();
  }

  @override
  Future<bool> exist(String key) => provider.containsKey(key);

  @override
  Future<JsonData?> get(String key) => provider.read(key);

  @override
  Future<bool> set(String key, JsonData value) => provider.put(key, value);
  
}
