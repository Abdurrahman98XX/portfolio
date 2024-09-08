// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'who_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhoEntity _$WhoEntityFromJson(Map<String, dynamic> json) => $checkedCreate(
      'WhoEntity',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'who',
            'type',
            'name',
            'id',
            'vId',
            'createdAt',
            'modifiedAt',
            'eWho'
          ],
        );
        final val = WhoEntity(
          who: $checkedConvert(
              'who',
              (v) => v == null
                  ? null
                  : WhoEntity.fromJson(v as Map<String, dynamic>)),
          id: $checkedConvert('id', (v) => v as String),
          vId: $checkedConvert('vId', (v) => v as String),
          eWho: $checkedConvert('eWho', (v) => $enumDecode(_$WHOEnumMap, v)),
          name: $checkedConvert('name', (v) => v as String),
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

Map<String, dynamic> _$WhoEntityToJson(WhoEntity instance) => <String, dynamic>{
      'who': instance.who?.toJson(),
      'type': instance.type,
      'name': instance.name,
      'id': instance.id,
      'vId': instance.vId,
      'createdAt': const EpochDateTimeConverter().toJson(instance.createdAt),
      'modifiedAt': const EpochDateTimeConverter().toJson(instance.modifiedAt),
      'eWho': _$WHOEnumMap[instance.eWho]!,
    };

const _$WHOEnumMap = {
  WHO.user: 'user',
  WHO.defaults: 'defaults',
  WHO.system: 'system',
};
