// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_finding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceFinding _$AttendanceFindingFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AttendanceFinding',
      json,
      ($checkedConvert) {
        final val = AttendanceFinding(
          type: $checkedConvert('type', (v) => v as String?),
          severity: $checkedConvert('severity', (v) => v as String?),
          message: $checkedConvert('message', (v) => v as String?),
          excused: $checkedConvert('excused', (v) => v as bool?),
          excuseId: $checkedConvert('excuseId', (v) => (v as num?)?.toInt()),
          excuseNote: $checkedConvert('excuseNote', (v) => v as String?),
          excusedBy: $checkedConvert('excusedBy', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$AttendanceFindingToJson(AttendanceFinding instance) =>
    <String, dynamic>{
      if (instance.type case final value?) 'type': value,
      if (instance.severity case final value?) 'severity': value,
      if (instance.message case final value?) 'message': value,
      if (instance.excused case final value?) 'excused': value,
      if (instance.excuseId case final value?) 'excuseId': value,
      if (instance.excuseNote case final value?) 'excuseNote': value,
      if (instance.excusedBy case final value?) 'excusedBy': value,
    };
