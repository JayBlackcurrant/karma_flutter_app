// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceDay _$AttendanceDayFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AttendanceDay',
      json,
      ($checkedConvert) {
        final val = AttendanceDay(
          date: $checkedConvert(
              'date', (v) => v == null ? null : DateTime.parse(v as String)),
          weekday: $checkedConvert('weekday', (v) => v as String?),
          in_: $checkedConvert('in', (v) => v as String?),
          out_: $checkedConvert('out', (v) => v as String?),
          minutes: $checkedConvert('minutes', (v) => v as num?),
          status: $checkedConvert('status', (v) => v as String?),
          workingDay: $checkedConvert('workingDay', (v) => v as bool?),
          findings: $checkedConvert(
              'findings',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      AttendanceFinding.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'in_': 'in', 'out_': 'out'},
    );

Map<String, dynamic> _$AttendanceDayToJson(AttendanceDay instance) =>
    <String, dynamic>{
      if (instance.date?.toIso8601String() case final value?) 'date': value,
      if (instance.weekday case final value?) 'weekday': value,
      if (instance.in_ case final value?) 'in': value,
      if (instance.out_ case final value?) 'out': value,
      if (instance.minutes case final value?) 'minutes': value,
      if (instance.status case final value?) 'status': value,
      if (instance.workingDay case final value?) 'workingDay': value,
      if (instance.findings?.map((e) => e.toJson()).toList() case final value?)
        'findings': value,
    };
