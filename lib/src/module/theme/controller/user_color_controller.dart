import 'package:flutter/material.dart';
import 'package:portfolio/src/module/theme/model/user_color_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_color_controller.g.dart';

@Riverpod(keepAlive: true)
class UserColorController extends _$UserColorController {
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

  void update(Color color) {
    if (state.userColor == color) return;
    state = state.copyWith(userColor: color, modifiedAt: DateTime.now());
  }
}
