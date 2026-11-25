// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_leave_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkLeaveRequest _$MarkLeaveRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MarkLeaveRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['status'],
        );
        final val = MarkLeaveRequest(
          status: $checkedConvert(
              'status',
              (v) => $enumDecode(_$LeaveStatusEnumMap, v,
                  unknownValue: LeaveStatus.unknownDefaultOpenApi)),
          count: $checkedConvert('count', (v) => v as num?),
          isUnpaid: $checkedConvert('isUnpaid', (v) => v as num?),
          additionalNotes:
              $checkedConvert('additionalNotes', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$MarkLeaveRequestToJson(MarkLeaveRequest instance) =>
    <String, dynamic>{
      'status': _$LeaveStatusEnumMap[instance.status]!,
      if (instance.count case final value?) 'count': value,
      if (instance.isUnpaid case final value?) 'isUnpaid': value,
      if (instance.additionalNotes case final value?) 'additionalNotes': value,
    };

const _$LeaveStatusEnumMap = {
  LeaveStatus.requested: 'Requested',
  LeaveStatus.approved: 'Approved',
  LeaveStatus.rejected: 'Rejected',
  LeaveStatus.unknownDefaultOpenApi: 'unknown_default_open_api',
};
