// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_color_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppColorEntity _$AppColorEntityFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AppColorEntity',
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
            'who',
            'userColor'
          ],
        );
        final val = AppColorEntity(
          id: $checkedConvert('id', (v) => v as String),
          vId: $checkedConvert('vId', (v) => v as String),
          who: $checkedConvert(
              'who', (v) => WhoEntity.fromJson(v as Map<String, dynamic>)),
          name: $checkedConvert('name', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
          userColor: $checkedConvert('userColor',
              (v) => const ColorConverter().fromJson((v as num).toInt())),
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

Map<String, dynamic> _$AppColorEntityToJson(AppColorEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'id': instance.id,
      'vId': instance.vId,
      'createdAt': const EpochDateTimeConverter().toJson(instance.createdAt),
      'modifiedAt': const EpochDateTimeConverter().toJson(instance.modifiedAt),
      'who': instance.who.toJson(),
      'userColor': const ColorConverter().toJson(instance.userColor),
    };
