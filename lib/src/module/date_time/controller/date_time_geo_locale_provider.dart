import 'dart:async';
import 'dart:convert';
import 'package:devicelocale/devicelocale.dart';
import 'package:device_region/device_region.dart';
import 'package:portfolio/src/entity/base_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/entity/cache_keys_entity.dart';
import 'package:portfolio/src/service/internet_check.dart';
import 'package:portfolio/src/service/service_locator.dart';
import 'package:portfolio/src/module/date_time/model/cached_date_time_entity.dart';

final onlineDateTimeProvider = FutureProvider<CachedOnlineDateTimeEntity?>(
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
  name: 'onlineDateTimeProvider',
);

final buildTimeProvider = Provider<DateTime>(
  name: 'buildTimeProvider',
  (ref) => DateTime.fromMillisecondsSinceEpoch(
      const int.fromEnvironment('epoch') * 1000),
);

final localDateTimeProvider = FutureProvider<DateTime?>(
  name: 'localDateTimeProvider',
  (ref) async {
    final cached = await ServiceLocator.cache
        .get(CacheKeys.localDateTime, CacheLocaldDateTimeEntity.fromJson);
    final timeNow = DateTime.now().millisecondsSinceEpoch;
    final timer = Timer.periodic(
      const Duration(seconds: 10),
      (_) async => (cached?.unixtime.millisecondsSinceEpoch ?? 0) < timeNow
          ? await ServiceLocator.cache.set(CacheKeys.localDateTime,
              CacheLocaldDateTimeEntity(timeNow).toJson())
          : null,
    );
    ref.onDispose(timer.cancel);
  },
);

// return await ServiceLocator.cache
//           .get(CacheKeys.onlineDateTime, OnlineDateTimeEntity.fromJson);

final unixLocal = DateTime.now().millisecondsSinceEpoch ~/ 1000;
const buildTime = int.fromEnvironment('epoch', defaultValue: 1728244674);
//
// final simCountry = await DeviceRegion.getSIMCountryCode();
// final languages = await Devicelocale.preferredLanguages;
// final locale = await Devicelocale.currentLocale;
