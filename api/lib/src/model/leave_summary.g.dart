// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveSummary _$LeaveSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LeaveSummary',
      json,
      ($checkedConvert) {
        final val = LeaveSummary(
          leaves: $checkedConvert(
              'leaves',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Leave.fromJson(e as Map<String, dynamic>))
                  .toList()),
          paidLeavesRemaining:
              $checkedConvert('paidLeavesRemaining', (v) => v as num?),
          unpaidLeavesTaken:
              $checkedConvert('unpaidLeavesTaken', (v) => v as num?),
          totalLeaves: $checkedConvert('totalLeaves', (v) => v as num?),
          wfhleavesRemaining:
              $checkedConvert('wfhleavesRemaining', (v) => v as num?),
          totalWFHLeaves: $checkedConvert('totalWFHLeaves', (v) => v as num?),
        );
        return val;
      },
    );

Map<String, dynamic> _$LeaveSummaryToJson(LeaveSummary instance) =>
    <String, dynamic>{
      if (instance.leaves?.map((e) => e.toJson()).toList() case final value?)
        'leaves': value,
      if (instance.paidLeavesRemaining case final value?)
        'paidLeavesRemaining': value,
      if (instance.unpaidLeavesTaken case final value?)
        'unpaidLeavesTaken': value,
      if (instance.totalLeaves case final value?) 'totalLeaves': value,
      if (instance.wfhleavesRemaining case final value?)
        'wfhleavesRemaining': value,
      if (instance.totalWFHLeaves case final value?) 'totalWFHLeaves': value,
    };
