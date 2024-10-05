import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/src/common/json_conversion.dart';
import 'package:portfolio/src/entity/who_entity.dart';

part 'base_entity.g.dart';

// TODO: whenever Making an entity, always use `BaseEntity`
// HACK: add every new `property` you declare to the `equality` list
// TODO: update `copyWith()` to match with the constuctor
/// This class provides common properties and methods that are shared by all entities.
///
/// It serves as a base class for other entity classes in the application.
@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  converters: converters,
)
abstract class AbstractBaseEntity extends Equatable {
  const AbstractBaseEntity({
    required this.id,
    required this.vId,
    required this.name,
    required this.type,
    required this.createdAt,
    required this.modifiedAt,
  });
  AbstractBaseEntity copyWith({
    String? id,
    String? vId,
    String? type,
    String? name,
    DateTime? createdAt,
    DateTime? modifiedAt,
  });

  /// The type of the entity
  @JsonKey(includeToJson: true)
  final String type;

  /// The name of the entity
  @JsonKey(includeToJson: true)
  final String name;

  /// The unique identifier of the entity
  @JsonKey(includeToJson: true)
  final String id;

  /// identifier that changes when the entity is modified
  @JsonKey(includeToJson: true)
  final String vId;

  /// The date and time when the entity was created
  @JsonKey(includeToJson: true)
  final DateTime createdAt;

  /// The date and time when the entity was last modified
  @JsonKey(includeToJson: true)
  final DateTime modifiedAt;

  @override
  List get props => [..._base, ...equality];

  List get _base => [name, id, vId, type, createdAt, modifiedAt];

  /// define every property that is not in the [props] list
  ///
  /// this is used to in contrast with equatable package
  List get equality;

  /// serializes object to a map (json like)
  JsonData toJson() => _$AbstractBaseEntityToJson(this);
}

@JsonSerializable(converters: converters)
class BaseEntity extends AbstractBaseEntity {
  const BaseEntity({
    required this.who,
    required super.id,
    required super.vId,
    required super.name,
    required super.type,
    required super.createdAt,
    required super.modifiedAt,
  });

  final WhoEntity who;

  @override
  BaseEntity copyWith({
    String? id,
    String? vId,
    String? type,
    String? name,
    WhoEntity? who,
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) {
    return BaseEntity(
      id: id ?? this.id,
      who: who ?? this.who,
      vId: vId ?? this.vId,
      name: name ?? this.name,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
    );
  }

  @override
  List get equality => [who];

  factory BaseEntity.fromJson(JsonData json) => _$BaseEntityFromJson(json);

  @override
  JsonData toJson() => _$BaseEntityToJson(this);
}

enum Source { user, system }

enum WHOEnum { user, defaults, system }

typedef JsonData = Map<String, dynamic>;
