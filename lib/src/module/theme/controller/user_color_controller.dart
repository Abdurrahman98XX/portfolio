import 'package:flutter/material.dart';
import 'package:portfolio/src/module/theme/model/user_color_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_color_controller.g.dart';

@riverpod
class UserColorController extends _$UserColorController {
  @override
  UserColorEntity build() {
    return UserColorEntity(
      userColor: Colors.blue,
      modifiedAt: DateTime.now(),
      createdAt: DateTime.now(),
      id: 'user_color',
      name: 'User Color',
      type: 'color',
      vId: '1',
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
