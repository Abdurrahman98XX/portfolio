import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/module/theme/model/app_color_entity.dart';

class AppColorNotifier extends Notifier<AppColorEntity> {
  static final provider = NotifierProvider<AppColorNotifier, AppColorEntity>(
    AppColorNotifier.new,
    name: 'AppColorNotifier',
  );
  @override
  AppColorEntity build() {
    return AppColorEntity(
      userColor: Colors.blue,
      modifiedAt: DateTime.now(),
      createdAt: DateTime.now(),
      id: 'user_color',
      name: 'User Color',
      type: 'color',
      vId: '1',
    );
  }

  /// returns old state when updating completes
  AppColorEntity? update(Color color) {
    if (state.userColor == color) return null;
    final prev = state;
    state = state.copyWith(userColor: color, modifiedAt: DateTime.now());
    return prev;
  }
}
