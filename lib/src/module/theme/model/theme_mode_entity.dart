import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/src/entity/who_entity.dart';
import 'package:portfolio/src/common/json_conversion.dart';
import 'package:portfolio/src/entity/base_entity.dart';
part 'theme_mode_entity.g.dart';

@JsonSerializable(converters: converters)
class ThemeModeEntity extends BaseEntity {
  const ThemeModeEntity({
    required super.id,
    required super.vId,
    required super.who,
    required super.name,
    required super.type,
    required this.themeMode,
    required super.createdAt,
    required super.modifiedAt,
  });

  final ThemeMode themeMode;

  factory ThemeModeEntity.fromJson(JsonData json) =>
      _$ThemeModeEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ThemeModeEntityToJson(this);

  @override
  ThemeModeEntity copyWith({
    String? id,
    String? vId,
    String? name,
    String? type,
    WhoEntity? who,
    WhoEntity? whoEnum,
    DateTime? createdAt,
    ThemeMode? themeMode,
    DateTime? modifiedAt,
  }) {
    return ThemeModeEntity(
      id: id ?? this.id,
      vId: vId ?? this.vId,
      who: who ?? this.who,
      name: name ?? this.name,
      type: type ?? this.type,
      themeMode: themeMode ?? this.themeMode,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
    );
  }

  @override
  List get equality => [themeMode];
}
