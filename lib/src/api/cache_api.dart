import 'package:portfolio/src/common/const.dart';
import 'package:portfolio/src/service/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheApi {
  Future<bool> set(String key, String value);
  Future<String?> get(String key);
  Future<bool> exist(String key);
  Future<Map<String, Object?>> getDatabase();
  Future<bool> eraseDatabase();
  Future<bool> remove(String key);
}

class CacheManager implements CacheApi {
  final _provider = SharedPreferencesAsync();
  // TODO: support encryption
  @override
  Future<bool> remove(String key) async {
    await _provider.remove(key);
    return true;
  }

  @override
  Future<bool> eraseDatabase() async {
    await _provider.clear();
    return true;
  }

  @override
  Future<JsonData> getDatabase() {
    return _provider.getAll();
  }

  @override
  Future<bool> exist(String key) {
    return _provider.containsKey(key);
  }

  @override
  Future<String?> get(String key) async {
    try {
      return await _provider.getString(key);
    } on TypeError catch (e) {
      ServiceLocator.logger.error(e, TypeError, e.stackTrace);
      return null;
    }
  }

  @override
  Future<bool> set(String key, String value) async {
    try {
      await _provider.setString(key, value);
      return true;
    } catch (e, st) {
      ServiceLocator.logger.error(e, '', st);
      return false;
    }
  }
}
