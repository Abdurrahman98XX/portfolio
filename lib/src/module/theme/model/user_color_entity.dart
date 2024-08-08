import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/src/common/json_conversion.dart';
import 'package:portfolio/src/module/base_entity/base_entity.dart';
part 'user_color_entity.g.dart';

@jsonC
class UserColorEntity extends BaseEntity {
  const UserColorEntity({
    required this.userColor,
    required super.name,
    required super.id,
    required super.vId,
    required super.type,
    required super.createdAt,
    required super.modifiedAt,
  });
  final Color userColor;
  @override
  List get equality => [userColor];
  factory UserColorEntity.fromJson(Map<String, dynamic> json) =>
      _$UserColorEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UserColorEntityToJson(this);

  @override
  UserColorEntity copyWith({
    Color? userColor,
    String? name,
    String? id,
    String? vId,
    String? type,
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) =>
      UserColorEntity(
        userColor: userColor ?? this.userColor,
        name: name ?? this.name,
        id: id ?? this.id,
        vId: vId ?? this.vId,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        modifiedAt: modifiedAt ?? this.modifiedAt,
      );
}
