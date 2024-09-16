import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/src/entity/who_entity.dart';
import 'package:portfolio/src/common/json_conversion.dart';
import 'package:portfolio/src/entity/base_entity.dart';
part 'user_color_entity.g.dart';

@JsonSerializable(converters: converters)
class UserColorEntity extends BaseEntity {
  const UserColorEntity({
    super.who,
    required super.id,
    required super.vId,
    required super.name,
    required super.type,
    required this.userColor,
    required super.createdAt,
    required super.modifiedAt,
  });

  final Color userColor;

  factory UserColorEntity.fromJson(JsonData json) =>
      _$UserColorEntityFromJson(json);

  @override
  JsonData toJson() => _$UserColorEntityToJson(this);

  @override
  UserColorEntity copyWith({
    String? id,
    String? vId,
    String? name,
    String? type,
    WhoEntity? who,
    Color? userColor,
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) {
    return UserColorEntity(
      userColor: userColor ?? this.userColor,
      name: name ?? this.name,
      id: id ?? this.id,
      vId: vId ?? this.vId,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      who: who ?? this.who,
    );
  }

  @override
  List get equality => [userColor];
}
