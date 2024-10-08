import 'dart:async';
import 'dart:convert';
import 'package:devicelocale/devicelocale.dart';
import 'package:device_region/device_region.dart';
import 'package:portfolio/src/entity/base_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/service/internet_check.dart';
import 'package:portfolio/src/service/service_locator.dart';
import 'package:portfolio/src/entity/cache_keys_entity.dart';
import 'package:portfolio/src/module/date_time/model/cached_date_time_entity.dart';

final onlineDateTimeProvider = FutureProvider<CachedOnlineDateTimeEntity?>(
  name: 'onlineDateTimeProvider',
  (ref) async {
    if (ref.watch(firstInternetConnectionProvider)) {
      final data = await ServiceLocator.client
          .get(Uri.parse('http://worldtimeapi.org/api/ip'));
      if (data.statusCode == 200) {
        final JsonData json =
            await ServiceLocator.worker.send(() => jsonDecode(data.body));
        await ServiceLocator.cache.set(CacheKeys.onlineDateTime, json);
        return CachedOnlineDateTimeEntity.fromJson(json);
      }
    }
    return null;
  },
);

final buildTimeProvider = Provider<DateTime>(
  name: 'buildTimeProvider',
  (ref) => DateTime.fromMillisecondsSinceEpoch(
      const int.fromEnvironment('epoch') * 1000),
);

final localDateTimeProvider = FutureProvider<void>(
  name: 'localDateTimeProvider',
  (ref) async {
    int localEpochTime = DateTime.now().millisecondsSinceEpoch;
    CacheLocaldDateTimeEntity? localCached = await ServiceLocator.cache
        .get(CacheKeys.localDateTime, CacheLocaldDateTimeEntity.fromJson);
    final timer = Timer.periodic(
      const Duration(seconds: 10),
      (controller) async {
        localCached = await ServiceLocator.cache
            .get(CacheKeys.localDateTime, CacheLocaldDateTimeEntity.fromJson);
        if (localEpochTime > (localCached?.epochTime ?? 0)) {
          await ServiceLocator.cache.set(
            CacheKeys.localDateTime,
            CacheLocaldDateTimeEntity(localEpochTime).toJson(),
          );
          localEpochTime = DateTime.now().millisecondsSinceEpoch;
        } else {
          controller.cancel();
        }
      },
    );
    ref.onDispose(timer.cancel);
  },
);

final tamperedDateTimeLogicProvider = FutureProvider<bool>(
  name: 'tamperedDateTimeLogicProvider',
  (ref) async {
    final buildTime = ref.read(buildTimeProvider);
    final locale = await Devicelocale.currentLocale;
    final languages = await Devicelocale.preferredLanguages;
    final simCountry = await DeviceRegion.getSIMCountryCode();
    final onlineDateTime = ref.watch(onlineDateTimeProvider).valueOrNull;
    final localEpochTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final localCached = await ServiceLocator.cache
        .get(CacheKeys.localDateTime, CacheLocaldDateTimeEntity.fromJson);

    return true;
  },
);
