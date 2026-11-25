// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceReport _$AttendanceReportFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AttendanceReport',
      json,
      ($checkedConvert) {
        final val = AttendanceReport(
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
          employeeId:
              $checkedConvert('employeeId', (v) => (v as num?)?.toInt()),
          biometricCode:
              $checkedConvert('biometricCode', (v) => (v as num?)?.toInt()),
          nameInFile: $checkedConvert('nameInFile', (v) => v as String?),
          summary: $checkedConvert(
              'summary',
              (v) => v == null
                  ? null
                  : AttendanceSummary.fromJson(v as Map<String, dynamic>)),
          days: $checkedConvert(
              'days',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => AttendanceDay.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$AttendanceReportToJson(AttendanceReport instance) =>
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
      if (instance.employeeId case final value?) 'employeeId': value,
      if (instance.biometricCode case final value?) 'biometricCode': value,
      if (instance.nameInFile case final value?) 'nameInFile': value,
      if (instance.summary?.toJson() case final value?) 'summary': value,
      if (instance.days?.map((e) => e.toJson()).toList() case final value?)
        'days': value,
    };
