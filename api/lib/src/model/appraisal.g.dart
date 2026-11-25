// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appraisal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appraisal _$AppraisalFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Appraisal',
      json,
      ($checkedConvert) {
        final val = Appraisal(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          appraisalCycleId:
              $checkedConvert('AppraisalCycleId', (v) => (v as num?)?.toInt()),
          employeeId:
              $checkedConvert('EmployeeId', (v) => (v as num?)?.toInt()),
          employeeName: $checkedConvert('employeeName', (v) => v as String?),
          state: $checkedConvert('state', (v) => v as String?),
          selfSubmittedOn: $checkedConvert('selfSubmittedOn',
              (v) => v == null ? null : DateTime.parse(v as String)),
          eligibleForBonus:
              $checkedConvert('eligibleForBonus', (v) => v as bool?),
          averageRawRating:
              $checkedConvert('averageRawRating', (v) => v as num?),
          finalBonus: $checkedConvert('finalBonus', (v) => v as num?),
          appraisalCycle: $checkedConvert(
              'AppraisalCycle',
              (v) => v == null
                  ? null
                  : AppraisalCycle.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'appraisalCycleId': 'AppraisalCycleId',
        'employeeId': 'EmployeeId',
        'appraisalCycle': 'AppraisalCycle'
      },
    );

Map<String, dynamic> _$AppraisalToJson(Appraisal instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.appraisalCycleId case final value?)
        'AppraisalCycleId': value,
      if (instance.employeeId case final value?) 'EmployeeId': value,
      if (instance.employeeName case final value?) 'employeeName': value,
      if (instance.state case final value?) 'state': value,
      if (instance.selfSubmittedOn?.toIso8601String() case final value?)
        'selfSubmittedOn': value,
      if (instance.eligibleForBonus case final value?)
        'eligibleForBonus': value,
      if (instance.averageRawRating case final value?)
        'averageRawRating': value,
      if (instance.finalBonus case final value?) 'finalBonus': value,
      if (instance.appraisalCycle?.toJson() case final value?)
        'AppraisalCycle': value,
    };
