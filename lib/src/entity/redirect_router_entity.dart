import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RedirectRouterEntity extends Equatable {
  const RedirectRouterEntity({required this.isInit});

  static final notifier = ValueNotifier<AsyncValue<RedirectRouterEntity>>(
    const AsyncLoading(),
  );

  final bool isInit;

  RedirectRouterEntity copyWith({
    bool? isInit,
  }) =>
      RedirectRouterEntity(
        isInit: isInit ?? this.isInit,
      );

  @override
  List get props => [isInit];
}
