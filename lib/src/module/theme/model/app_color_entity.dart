import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/src/entity/who_entity.dart';
import 'package:portfolio/src/entity/json_conversion.dart';
import 'package:portfolio/src/entity/base_entity.dart';
part 'app_color_entity.g.dart';

@JsonSerializable(converters: converters)
class AppColorEntity extends BaseEntity {
  const AppColorEntity({
    required super.id,
    required super.vId,
    required super.who,
    required super.name,
    required super.type,
    required this.appColor,
    required super.createdAt,
    required super.modifiedAt,
  });

  final Color appColor;

  factory AppColorEntity.fromJson(JsonData json) =>
      _$AppColorEntityFromJson(json);

  @override
  JsonData toJson() => _$AppColorEntityToJson(this);

  @override
  AppColorEntity copyWith({
    String? id,
    String? vId,
    String? name,
    String? type,
    WhoEntity? who,
    Color? appColor,
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) {
    return AppColorEntity(
      id: id ?? this.id,
      vId: vId ?? this.vId,
      who: who ?? this.who,
      name: name ?? this.name,
      type: type ?? this.type,
      appColor: appColor ?? this.appColor,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
    );
  }

  @override
  List get equality => [appColor];
}
