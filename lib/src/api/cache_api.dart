import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:portfolio/src/base/base_entity.dart';

abstract class CacheApi<P> {
  const CacheApi(this.provider);
  final P provider;
  FutureOr<Either<CacheError, JsonData>> pop(String key);
  FutureOr<Either<CacheError, bool>> eraseDatabase();
  FutureOr<Either<CacheError, bool>> exist(String key);
  FutureOr<Either<CacheError, JsonData?>> get(String key);
  FutureOr<Either<CacheError, bool>> set(String key, JsonData value);
}

class CacheManager extends CacheApi<FlutterSecureStorage> {
  const CacheManager(super.provider);

  @override
  Future<Either<CacheError, bool>> pop(String key) async {
    try {
      await provider.delete(key: key);
      return right(true);
    } catch (e, st) {
      return left(CacheDeleteError((e, st)));
    }
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

sealed class CacheError {
  const CacheError(this.error);
  final (dynamic, StackTrace) error;
}

class CacheDeleteError extends CacheError {
  const CacheDeleteError(super.error);
}

class CacheReadError extends CacheError {
  const CacheReadError(super.error);
}

class CacheWriteError extends CacheError {
  const CacheWriteError(super.error);
}

class CacheUpdateError extends CacheError {
  const CacheUpdateError(super.error);
}
