import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/src/common/json_conversion.dart';

part 'base_entity.g.dart';

// CheckedFromJsonException is thrown when the JSON is not valid
// UnrecognizedKeysException is thrown when the JSON has unrecognized keys

/// This class provides common properties and methods that are shared by all entities.
///
/// It serves as a base class for other entity classes in the application.
@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  converters: converters,
)
// TODO: whenever Making an entity use `BaseEntity`
// HACK: add every new `property` you declare to the `equality` list
// TODO: update `copyWith()` to match with the constuctor
abstract class BaseEntity extends Equatable {
  const BaseEntity({
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
  List get props => [name, id, vId, type, createdAt, modifiedAt, ...equality];

  /// define every property that is not in the [props] list
  ///
  /// this is used to in contrast with equatable package
  List get equality;

  /// serializes object to a map (json like)
  Map<String, dynamic> toJson() => _$BaseEntityToJson(this);
}

enum Source { user, system }

typedef JsonData = Map<String, dynamic>;
