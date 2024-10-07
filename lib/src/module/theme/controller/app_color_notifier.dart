import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/entity/cache_keys_entity.dart';
import 'package:portfolio/src/module/theme/model/app_color_entity.dart';
import 'package:portfolio/src/service/service_locator.dart';

class AppColorNotifier extends AsyncNotifier<AppColorEntity> {
  static final provider =
      AsyncNotifierProvider<AppColorNotifier, AppColorEntity>(
    AppColorNotifier.new,
    name: 'AppColorNotifier',
  );
  @override
  Future<AppColorEntity> build() async {
    final cache = await ServiceLocator.cache.get(
      CacheKeys.appColor,
      AppColorEntity.fromJson,
    );
    return cache ??
        AppColorEntity(
          appColor: Colors.blue,
          modifiedAt: DateTime.now(),
          createdAt: DateTime.now(),
          id: 'user_color',
          name: 'User Color',
          type: 'color',
          vId: '1',
        );
  }

  /// returns old state when updating completes
  @override
  AppColorEntity? update(Color color) {
    if (state.appColor == color) return null;
    final prev = state;
    state = state.copyWith(appColor: color, modifiedAt: DateTime.now());
    return prev;
  }
}
