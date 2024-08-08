// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_color_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserColorEntity _$UserColorEntityFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UserColorEntity',
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
            'userColor'
          ],
        );
        final val = UserColorEntity(
          userColor: $checkedConvert('userColor',
              (v) => const ColorConverter().fromJson((v as num).toInt())),
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

Map<String, dynamic> _$UserColorEntityToJson(UserColorEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'id': instance.id,
      'vId': instance.vId,
      'createdAt': const EpochDateTimeConverter().toJson(instance.createdAt),
      'modifiedAt': const EpochDateTimeConverter().toJson(instance.modifiedAt),
      'userColor': const ColorConverter().toJson(instance.userColor),
    };
