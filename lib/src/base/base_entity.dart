import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/src/base/who_entity.dart';
import 'package:portfolio/src/common/json_conversion.dart';

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
abstract class BaseEntity extends Equatable {
  const BaseEntity({
    this.who,
    required this.name,
    required this.id,
    required this.vId,
    required this.type,
    required this.createdAt,
    required this.modifiedAt,
  });
  BaseEntity copyWith({
    String? name,
    String? id,
    String? vId,
    String? type,
    DateTime? createdAt,
    DateTime? modifiedAt,
    WhoEntity? who,
  });

  /// Who created the objects
  @JsonKey(includeToJson: true)
  final WhoEntity? who;

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

  List get _base => [name, id, vId, type, createdAt, modifiedAt, who];

  /// define every property that is not in the [props] list
  ///
  /// this is used to in contrast with equatable package
  List get equality;

  /// serializes object to a map (json like)
  Map<String, dynamic> toJson() => _$BaseEntityToJson(this);
}

enum Source { user, system }

enum WHO { user, defaults, system }

typedef JsonData = Map<String, dynamic>;
