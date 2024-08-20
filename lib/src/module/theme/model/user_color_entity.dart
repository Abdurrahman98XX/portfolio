import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/src/common/json_conversion.dart';
import 'package:portfolio/src/base/base_entity.dart';
part 'user_color_entity.g.dart';

@JsonSerializable(converters: converters)
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

  factory UserColorEntity.fromJson(JsonData json) => _$UserColorEntityFromJson(json);

  @override
  JsonData toJson() => _$UserColorEntityToJson(this);

  @override
  UserColorEntity copyWith({
    Color? userColor,
    String? name,
    String? id,
    String? vId,
    String? type,
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
    );
  }

  @override
  List get equality => [userColor];
}
