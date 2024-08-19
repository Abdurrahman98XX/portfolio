import 'package:hive/hive.dart';
import 'package:portfolio/src/module/base/base_entity.dart';
import 'package:portfolio/src/service/service_locator.dart';

class CacheManager {
  CacheManager({required this.group});

  final String group;

  late final provider = Hive.box<JsonData>(
    encryptionKey: ServiceLocator.key,
    name: group,
  );

  bool remove(String key) => provider.delete(key);

  void eraseDatabase() => provider.clear();

  bool exist(String key) => provider.containsKey(key);

  JsonData? get(String key) => provider.get(key);

  void set(String key, JsonData value) => provider.put(key, value);
}
