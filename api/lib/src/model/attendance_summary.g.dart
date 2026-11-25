// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceSummary _$AttendanceSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AttendanceSummary',
      json,
      ($checkedConvert) {
        final val = AttendanceSummary(
          workingDays: $checkedConvert('workingDays', (v) => v as num?),
          presentDays: $checkedConvert('presentDays', (v) => v as num?),
          wfhDays: $checkedConvert('wfhDays', (v) => v as num?),
          leaveDays: $checkedConvert('leaveDays', (v) => v as num?),
          holidays: $checkedConvert('holidays', (v) => v as num?),
          totalMinutes: $checkedConvert('totalMinutes', (v) => v as num?),
          averageMinutes: $checkedConvert('averageMinutes', (v) => v as num?),
          late_: $checkedConvert('late', (v) => v as num?),
          short: $checkedConvert('short', (v) => v as num?),
          missingPunch: $checkedConvert('missingPunch', (v) => v as num?),
          unexplained: $checkedConvert('unexplained', (v) => v as num?),
          pendingLeave: $checkedConvert('pendingLeave', (v) => v as num?),
          kudos: $checkedConvert('kudos', (v) => v as num?),
          warnings: $checkedConvert('warnings', (v) => v as num?),
          notes: $checkedConvert('notes', (v) => v as num?),
          excused: $checkedConvert('excused', (v) => v as num?),
        );
        return val;
      },
      fieldKeyMap: const {'late_': 'late'},
    );

Map<String, dynamic> _$AttendanceSummaryToJson(AttendanceSummary instance) =>
    <String, dynamic>{
      if (instance.workingDays case final value?) 'workingDays': value,
      if (instance.presentDays case final value?) 'presentDays': value,
      if (instance.wfhDays case final value?) 'wfhDays': value,
      if (instance.leaveDays case final value?) 'leaveDays': value,
      if (instance.holidays case final value?) 'holidays': value,
      if (instance.totalMinutes case final value?) 'totalMinutes': value,
      if (instance.averageMinutes case final value?) 'averageMinutes': value,
      if (instance.late_ case final value?) 'late': value,
      if (instance.short case final value?) 'short': value,
      if (instance.missingPunch case final value?) 'missingPunch': value,
      if (instance.unexplained case final value?) 'unexplained': value,
      if (instance.pendingLeave case final value?) 'pendingLeave': value,
      if (instance.kudos case final value?) 'kudos': value,
      if (instance.warnings case final value?) 'warnings': value,
      if (instance.notes case final value?) 'notes': value,
      if (instance.excused case final value?) 'excused': value,
    };
