import 'package:portfolio/src/module/base/base_entity.dart';
part 'color_source_entity.g.dart';

@jsonC
class ColorSourceEntity extends BaseEntity {
  const ColorSourceEntity({
    required this.source,
    required super.name,
    required super.id,
    required super.vId,
    required super.type,
    required super.createdAt,
    required super.modifiedAt,
  });
  final Source source;
  @override
  List get equality => [source];
  factory ColorSourceEntity.fromJson(Map<String, dynamic> json) =>
      _$ColorSourceEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ColorSourceEntityToJson(this);
  @override
  ColorSourceEntity copyWith({
    Source? source,
    String? name,
    String? id,
    String? vId,
    String? type,
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) {
    return ColorSourceEntity(
      source: source ?? this.source,
      name: name ?? this.name,
      id: id ?? this.id,
      vId: vId ?? this.vId,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
    );
  }
}
