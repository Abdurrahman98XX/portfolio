// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_source_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorSourceEntity _$ColorSourceEntityFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ColorSourceEntity',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'type',
            'name',
            'id',
            'vId',
            'createdAt',
            'modifiedAt',
            'source'
          ],
        );
        final val = ColorSourceEntity(
          source:
              $checkedConvert('source', (v) => $enumDecode(_$SourceEnumMap, v)),
          name: $checkedConvert('name', (v) => v as String),
          id: $checkedConvert('id', (v) => v as String),
          vId: $checkedConvert('vId', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
          createdAt: $checkedConvert(
              'createdAt',
              (v) =>
                  const EpochDateTimeConverter().fromJson((v as num).toInt())),
          modifiedAt: $checkedConvert(
              'modifiedAt',
              (v) =>
                  const EpochDateTimeConverter().fromJson((v as num).toInt())),
        );
        return val;
      },
    );

Map<String, dynamic> _$ColorSourceEntityToJson(ColorSourceEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'id': instance.id,
      'vId': instance.vId,
      'createdAt': const EpochDateTimeConverter().toJson(instance.createdAt),
      'modifiedAt': const EpochDateTimeConverter().toJson(instance.modifiedAt),
      'source': _$SourceEnumMap[instance.source]!,
    };

const _$SourceEnumMap = {
  Source.user: 'user',
  Source.system: 'system',
};
