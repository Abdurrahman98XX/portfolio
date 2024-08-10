import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/src/common/json_conversion.dart';
part 'base_entity.g.dart';

// TODO UNDONE HACK FIXME
// CheckedFromJsonException is thrown when the JSON is not valid
// UnrecognizedKeysException is thrown when the JSON has unrecognized keys
const jsonC = JsonSerializable(converters: converters);

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  converters: converters,
)
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
  @JsonKey(includeToJson: true)
  final String type, name, id, vId;
  @JsonKey(includeToJson: true)
  final DateTime createdAt, modifiedAt;
  @override
  List get props => [...equality, name, id, vId, type, createdAt, modifiedAt];
  List get equality;
  Map<String, dynamic> toJson() => _$BaseEntityToJson(this);
}
