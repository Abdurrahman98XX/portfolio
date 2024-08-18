import 'package:flutter/material.dart';
import 'package:portfolio/src/module/theme/model/user_color_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'color_controller.g.dart';

@riverpod
class ColorController extends _$ColorController {
  @override
  UserColorEntity build() {
    return UserColorEntity(
      userColor: Colors.brown,
      name: 'name',
      id: 'id',
      vId: 'vId',
      type: 'type',
      createdAt: DateTime.now(),
      modifiedAt: DateTime.now(),
    );
  }

  /// returns old state when replaced by another
  UserColorEntity? update(Color color) {
    if (state.userColor == color) return null;
    final prev = state;
    state = state.copyWith(userColor: color, modifiedAt: DateTime.now());
    return prev;
  }
}
