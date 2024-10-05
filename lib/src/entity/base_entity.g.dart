// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AbstractBaseEntityToJson(AbstractBaseEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'id': instance.id,
      'vId': instance.vId,
      'createdAt': const EpochDateTimeConverter().toJson(instance.createdAt),
      'modifiedAt': const EpochDateTimeConverter().toJson(instance.modifiedAt),
    };

BaseEntity _$BaseEntityFromJson(Map<String, dynamic> json) => $checkedCreate(
      'BaseEntity',
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
            'who'
          ],
        );
        final val = BaseEntity(
          who: $checkedConvert(
              'who', (v) => WhoEntity.fromJson(v as Map<String, dynamic>)),
          id: $checkedConvert('id', (v) => v as String),
          vId: $checkedConvert('vId', (v) => v as String),
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

Map<String, dynamic> _$BaseEntityToJson(BaseEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'id': instance.id,
      'vId': instance.vId,
      'createdAt': const EpochDateTimeConverter().toJson(instance.createdAt),
      'modifiedAt': const EpochDateTimeConverter().toJson(instance.modifiedAt),
      'who': instance.who.toJson(),
    };
