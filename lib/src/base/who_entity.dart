import 'package:portfolio/src/base/base_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/src/common/json_conversion.dart';
part 'who_entity.g.dart';

@JsonSerializable(converters: converters)
class WhoEntity extends BaseEntity {
  const WhoEntity({
    super.who,
    required super.id,
    required super.vId,
    required this.eWho,
    required super.name,
    required super.type,
    required super.createdAt,
    required super.modifiedAt,
  });

  final WHO eWho;

  factory WhoEntity.fromJson(JsonData json) => _$WhoEntityFromJson(json);

  @override
  JsonData toJson() => _$WhoEntityToJson(this);

  @override
  WhoEntity copyWith({
    WHO? eWho,
    String? id,
    String? vId,
    String? name,
    String? type,
    WhoEntity? who,
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) {
    return WhoEntity(
      id: id ?? this.id,
      who: who ?? this.who,
      vId: vId ?? this.vId,
      eWho: eWho ?? this.eWho,
      name: name ?? this.name,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
    );
  }

  @override
  List get equality => [eWho];
}
