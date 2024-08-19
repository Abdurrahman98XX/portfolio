import 'package:flutter/material.dart';
import 'package:portfolio/src/module/base/base_entity.dart';
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

  factory ThemeModeEntity.fromJson(JsonData json) => _$ThemeModeEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ThemeModeEntityToJson(this);

  @override
  ThemeModeEntity copyWith({
    ThemeMode? themeMode,
    String? name,
    String? id,
    String? vId,
    String? type,
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) {
    return ThemeModeEntity(
      themeMode: themeMode ?? this.themeMode,
      name: name ?? this.name,
      id: id ?? this.id,
      vId: vId ?? this.vId,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
    );
  }

  @override
  List get equality => [themeMode];
}
