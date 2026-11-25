// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_month.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceMonth _$AttendanceMonthFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AttendanceMonth',
      json,
      ($checkedConvert) {
        final val = AttendanceMonth(
          month: $checkedConvert('month', (v) => v as String?),
          label: $checkedConvert('label', (v) => v as String?),
          fileName: $checkedConvert('fileName', (v) => v as String?),
          dataUntil: $checkedConvert('dataUntil',
              (v) => v == null ? null : DateTime.parse(v as String)),
          uploadedBy: $checkedConvert('uploadedBy', (v) => v as String?),
          uploadedAt: $checkedConvert('uploadedAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          publishedAt: $checkedConvert('publishedAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          emailSentAt: $checkedConvert('emailSentAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          summary: $checkedConvert(
              'summary',
              (v) => v == null
                  ? null
                  : AttendanceSummary.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$AttendanceMonthToJson(AttendanceMonth instance) =>
    <String, dynamic>{
      if (instance.month case final value?) 'month': value,
      if (instance.label case final value?) 'label': value,
      if (instance.fileName case final value?) 'fileName': value,
      if (instance.dataUntil?.toIso8601String() case final value?)
        'dataUntil': value,
      if (instance.uploadedBy case final value?) 'uploadedBy': value,
      if (instance.uploadedAt?.toIso8601String() case final value?)
        'uploadedAt': value,
      if (instance.publishedAt?.toIso8601String() case final value?)
        'publishedAt': value,
      if (instance.emailSentAt?.toIso8601String() case final value?)
        'emailSentAt': value,
      if (instance.summary?.toJson() case final value?) 'summary': value,
    };
