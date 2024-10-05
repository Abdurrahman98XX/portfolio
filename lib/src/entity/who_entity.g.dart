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
            'type',
            'name',
            'id',
            'vId',
            'createdAt',
            'modifiedAt',
            'whoEnum'
          ],
        );
        final val = WhoEntity(
          id: $checkedConvert('id', (v) => v as String),
          vId: $checkedConvert('vId', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
          whoEnum: $checkedConvert(
              'whoEnum', (v) => $enumDecode(_$WHOEnumEnumMap, v)),
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
      'type': instance.type,
      'name': instance.name,
      'id': instance.id,
      'vId': instance.vId,
      'createdAt': const EpochDateTimeConverter().toJson(instance.createdAt),
      'modifiedAt': const EpochDateTimeConverter().toJson(instance.modifiedAt),
      'whoEnum': _$WHOEnumEnumMap[instance.whoEnum]!,
    };

const _$WHOEnumEnumMap = {
  WHOEnum.user: 'user',
  WHOEnum.defaults: 'defaults',
  WHOEnum.system: 'system',
};
