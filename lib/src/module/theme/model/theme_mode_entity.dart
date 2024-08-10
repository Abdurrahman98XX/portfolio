import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/src/common/json_conversion.dart';
import 'package:portfolio/src/module/base_entity/base_entity.dart';
part 'theme_mode_entity.g.dart';

@jsonC
class ThemeModeEntity extends BaseEntity {
  const ThemeModeEntity({
    required this.themeMode,
    required super.name,
    required super.id,
    required super.vId,
    required super.type,
    required super.createdAt,
    required super.modifiedAt,
  });
  final ThemeMode themeMode;
  @override
  List get equality => [themeMode];
  factory ThemeModeEntity.fromJson(Map<String, dynamic> json) =>
      _$ThemeModeEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ThemeModeEntityToJson(this);

  @override
  ThemeModeEntity copyWith({
    String? name,
    String? id,
    String? vId,
    String? type,
    DateTime? createdAt,
    DateTime? modifiedAt,
    ThemeMode? themeMode,
  }) {
    return ThemeModeEntity(
      themeMode: themeMode ?? this.themeMode,
      name: name ?? super.name,
      id: id ?? super.id,
      vId: vId ?? super.vId,
      type: type ?? super.type,
      createdAt: createdAt ?? super.createdAt,
      modifiedAt: modifiedAt ?? super.modifiedAt,
    );
  }
}
