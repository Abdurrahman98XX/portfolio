import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/module/theme/model/user_color_entity.dart';

class UserColorController extends Notifier<UserColorEntity> {
  static final provider =
      NotifierProvider<UserColorController, UserColorEntity>(
    UserColorController.new,
    name: 'UserColorController',
  );
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

  /// returns old state when updating completes
  UserColorEntity? update(Color color) {
    if (state.userColor == color) return null;
    final prev = state;
    state = state.copyWith(userColor: color, modifiedAt: DateTime.now());
    return prev;
  }
}
