import 'package:flutter/material.dart';
import 'package:portfolio/src/module/base/base_entity.dart';
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

  /// color is
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
