import 'package:portfolio/src/entity/base_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/src/common/json_conversion.dart';
part 'who_entity.g.dart';

@JsonSerializable(converters: converters)
class WhoEntity extends AbstractBaseEntity {
  const WhoEntity({
    required super.id,
    required super.vId,
    required super.name,
    required super.type,
    required this.whoEnum,
    required super.createdAt,
    required super.modifiedAt,
  });

  final WHOEnum whoEnum;

  factory WhoEntity.fromJson(JsonData json) => _$WhoEntityFromJson(json);

  @override
  JsonData toJson() => _$WhoEntityToJson(this);

  @override
  WhoEntity copyWith({
    String? id,
    String? vId,
    String? name,
    String? type,
    WHOEnum? whoEnum,
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) {
    return WhoEntity(
      id: id ?? this.id,
      vId: vId ?? this.vId,
      name: name ?? this.name,
      type: type ?? this.type,
      whoEnum: whoEnum ?? this.whoEnum,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
    );
  }

  @override
  List get equality => [whoEnum];
}
