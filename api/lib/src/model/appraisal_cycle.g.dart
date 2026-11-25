// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appraisal_cycle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppraisalCycle _$AppraisalCycleFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AppraisalCycle',
      json,
      ($checkedConvert) {
        final val = AppraisalCycle(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
          cycleType: $checkedConvert('cycleType', (v) => v as String?),
          financialYear: $checkedConvert('financialYear', (v) => v as String?),
          periodStart: $checkedConvert('periodStart',
              (v) => v == null ? null : DateTime.parse(v as String)),
          periodEnd: $checkedConvert('periodEnd',
              (v) => v == null ? null : DateTime.parse(v as String)),
          monthsInWindow: $checkedConvert('monthsInWindow', (v) => v as num?),
          cycleCloseDate: $checkedConvert('cycleCloseDate',
              (v) => v == null ? null : DateTime.parse(v as String)),
          selfAssessmentOpensOn: $checkedConvert('selfAssessmentOpensOn',
              (v) => v == null ? null : DateTime.parse(v as String)),
          selfAssessmentClosesOn: $checkedConvert('selfAssessmentClosesOn',
              (v) => v == null ? null : DateTime.parse(v as String)),
          status: $checkedConvert(
              'status',
              (v) => $enumDecodeNullable(_$CycleStatusEnumMap, v,
                  unknownValue: CycleStatus.unknownDefaultOpenApi)),
          createdAt: $checkedConvert('createdAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          updatedAt: $checkedConvert('updatedAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$AppraisalCycleToJson(AppraisalCycle instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.cycleType case final value?) 'cycleType': value,
      if (instance.financialYear case final value?) 'financialYear': value,
      if (instance.periodStart?.toIso8601String() case final value?)
        'periodStart': value,
      if (instance.periodEnd?.toIso8601String() case final value?)
        'periodEnd': value,
      if (instance.monthsInWindow case final value?) 'monthsInWindow': value,
      if (instance.cycleCloseDate?.toIso8601String() case final value?)
        'cycleCloseDate': value,
      if (instance.selfAssessmentOpensOn?.toIso8601String() case final value?)
        'selfAssessmentOpensOn': value,
      if (instance.selfAssessmentClosesOn?.toIso8601String() case final value?)
        'selfAssessmentClosesOn': value,
      if (_$CycleStatusEnumMap[instance.status] case final value?)
        'status': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'createdAt': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updatedAt': value,
    };

const _$CycleStatusEnumMap = {
  CycleStatus.draft: 'Draft',
  CycleStatus.selfAssessmentOpen: 'Self Assessment Open',
  CycleStatus.selfAssessmentClosed: 'Self Assessment Closed',
  CycleStatus.rating: 'Rating',
  CycleStatus.calculated: 'Calculated',
  CycleStatus.locked: 'Locked',
  CycleStatus.paid: 'Paid',
  CycleStatus.unknownDefaultOpenApi: 'unknown_default_open_api',
};
