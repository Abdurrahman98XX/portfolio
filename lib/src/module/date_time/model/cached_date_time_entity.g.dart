// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_date_time_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CachedOnlineDateTimeEntity _$CachedOnlineDateTimeEntityFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'CachedOnlineDateTimeEntity',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'utc_offset',
            'timezone',
            'day_of_week',
            'day_of_year',
            'datetime',
            'utc_datetime',
            'unixtime',
            'raw_offset',
            'week_number',
            'dst',
            'abbreviation',
            'dst_offset',
            'dst_from',
            'dst_until',
            'client_ip'
          ],
        );
        final val = CachedOnlineDateTimeEntity(
          utcOffset: $checkedConvert('utc_offset', (v) => v as String),
          timezone: $checkedConvert('timezone', (v) => v as String),
          dayOfWeek: $checkedConvert('day_of_week', (v) => (v as num).toInt()),
          dayOfYear: $checkedConvert('day_of_year', (v) => (v as num).toInt()),
          datetime: $checkedConvert('datetime', (v) => v as String),
          utcDatetime: $checkedConvert('utc_datetime', (v) => v as String),
          unixtime: $checkedConvert('unixtime', (v) => (v as num).toInt()),
          rawOffset: $checkedConvert('raw_offset', (v) => (v as num).toInt()),
          weekNumber: $checkedConvert('week_number', (v) => (v as num).toInt()),
          dst: $checkedConvert('dst', (v) => v as bool),
          abbreviation: $checkedConvert('abbreviation', (v) => v as String),
          dstOffset: $checkedConvert('dst_offset', (v) => (v as num).toInt()),
          dstFrom: $checkedConvert('dst_from', (v) => v as String),
          dstUntil: $checkedConvert('dst_until', (v) => v as String),
          clientIp: $checkedConvert('client_ip', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'utcOffset': 'utc_offset',
        'dayOfWeek': 'day_of_week',
        'dayOfYear': 'day_of_year',
        'utcDatetime': 'utc_datetime',
        'rawOffset': 'raw_offset',
        'weekNumber': 'week_number',
        'dstOffset': 'dst_offset',
        'dstFrom': 'dst_from',
        'dstUntil': 'dst_until',
        'clientIp': 'client_ip'
      },
    );

Map<String, dynamic> _$CachedOnlineDateTimeEntityToJson(
        CachedOnlineDateTimeEntity instance) =>
    <String, dynamic>{
      'utc_offset': instance.utcOffset,
      'timezone': instance.timezone,
      'day_of_week': instance.dayOfWeek,
      'day_of_year': instance.dayOfYear,
      'datetime': instance.datetime,
      'utc_datetime': instance.utcDatetime,
      'unixtime': instance.unixtime,
      'raw_offset': instance.rawOffset,
      'week_number': instance.weekNumber,
      'dst': instance.dst,
      'abbreviation': instance.abbreviation,
      'dst_offset': instance.dstOffset,
      'dst_from': instance.dstFrom,
      'dst_until': instance.dstUntil,
      'client_ip': instance.clientIp,
    };

CacheLocaldDateTimeEntity _$CacheLocaldDateTimeEntityFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'CacheLocaldDateTimeEntity',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['epochTime'],
        );
        final val = CacheLocaldDateTimeEntity(
          $checkedConvert('epochTime', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$CacheLocaldDateTimeEntityToJson(
        CacheLocaldDateTimeEntity instance) =>
    <String, dynamic>{
      'epochTime': instance.epochTime,
    };
