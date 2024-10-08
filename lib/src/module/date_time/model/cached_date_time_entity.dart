import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/src/entity/json_conversion.dart';
import 'package:portfolio/src/entity/base_entity.dart';
part 'cached_date_time_entity.g.dart';

@JsonSerializable(converters: converters, fieldRename: FieldRename.snake)
class CachedOnlineDateTimeEntity extends Equatable {
  const CachedOnlineDateTimeEntity({
    required this.utcOffset,
    required this.timezone,
    required this.dayOfWeek,
    required this.dayOfYear,
    required this.datetime,
    required this.utcDatetime,
    required this.unixtime,
    required this.rawOffset,
    required this.weekNumber,
    required this.dst,
    required this.abbreviation,
    required this.dstOffset,
    required this.dstFrom,
    required this.dstUntil,
    required this.clientIp,
  });

  /// an ISO8601-valid string representing the offset from UTC
  final String utcOffset;

  /// timezone in Area/Location or Area/Location/Region format
  final String timezone;

  /// current day number of the week, where sunday is 0
  final int dayOfWeek;

  /// ordinal date of the current year
  final int dayOfYear;

  /// an ISO8601-valid string representing the current, local date/time
  final String datetime;

  /// an ISO8601-valid string representing the current date/time in UTC
  final String utcDatetime;

  /// number of seconds since the Epoch
  final int unixtime;

  /// the difference in seconds between the current local time and the time in UTC, excluding any daylight saving difference (see dst_offset)
  final int rawOffset;

  /// the current week number
  final int weekNumber;

  /// flag indicating whether the local time is in daylight savings
  final bool dst;

  /// the abbreviated name of the timezone
  final String abbreviation;

  /// the difference in seconds between the current local time and daylight saving time for the location
  final int dstOffset;

  /// an ISO8601-valid string representing the datetime when daylight savings started for this timezone
  final String dstFrom;

  /// an ISO8601-valid string representing the datetime when daylight savings will end for this timezone
  final String dstUntil;

  /// the ip of the currebt client requester
  final String clientIp;

  factory CachedOnlineDateTimeEntity.fromJson(JsonData json) =>
      _$CachedOnlineDateTimeEntityFromJson(json);

  JsonData toJson() => _$CachedOnlineDateTimeEntityToJson(this);

  @override
  List get props => [
        utcOffset,
        timezone,
        dayOfWeek,
        dayOfYear,
        datetime,
        utcDatetime,
        unixtime,
        rawOffset,
        weekNumber,
        dst,
        abbreviation,
        dstOffset,
        dstFrom,
        dstUntil,
        clientIp,
      ];
}

@JsonSerializable(converters: converters)
class CacheLocaldDateTimeEntity extends Equatable {
  const CacheLocaldDateTimeEntity(this.epochTime);
  final int epochTime;
  @override
  List get props => [epochTime];
  JsonData toJson() => _$CacheLocaldDateTimeEntityToJson(this);
  factory CacheLocaldDateTimeEntity.fromJson(JsonData json) =>
      _$CacheLocaldDateTimeEntityFromJson(json);
}
