// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HolidayRequest _$HolidayRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'HolidayRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['name', 'date'],
        );
        final val = HolidayRequest(
          name: $checkedConvert('name', (v) => v as String),
          date: $checkedConvert('date', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$HolidayRequestToJson(HolidayRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
    };
