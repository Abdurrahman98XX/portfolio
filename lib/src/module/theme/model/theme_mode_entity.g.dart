// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_mode_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeModeEntity _$ThemeModeEntityFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ThemeModeEntity',
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
            'themeMode'
          ],
        );
        final val = ThemeModeEntity(
          themeMode: $checkedConvert(
              'themeMode', (v) => $enumDecode(_$ThemeModeEnumMap, v)),
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

Map<String, dynamic> _$ThemeModeEntityToJson(ThemeModeEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'id': instance.id,
      'vId': instance.vId,
      'createdAt': const EpochDateTimeConverter().toJson(instance.createdAt),
      'modifiedAt': const EpochDateTimeConverter().toJson(instance.modifiedAt),
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};