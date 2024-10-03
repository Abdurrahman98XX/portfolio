import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RedirectRouterEntity extends Equatable {
  const RedirectRouterEntity({required this.isInit});

  static final notifier = ValueNotifier<RedirectRouterEntity>(
    RedirectRouterEntity(isInit: false),
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
