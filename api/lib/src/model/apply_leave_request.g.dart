// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_leave_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyLeaveRequest _$ApplyLeaveRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ApplyLeaveRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['reason', 'type', 'from', 'to'],
        );
        final val = ApplyLeaveRequest(
          reason: $checkedConvert(
              'reason',
              (v) => $enumDecode(_$LeaveReasonEnumMap, v,
                  unknownValue: LeaveReason.unknownDefaultOpenApi)),
          type: $checkedConvert(
              'type',
              (v) => $enumDecode(_$LeaveTypeEnumMap, v,
                  unknownValue: LeaveType.unknownDefaultOpenApi)),
          description: $checkedConvert('description', (v) => v as String?),
          from: $checkedConvert('from', (v) => v as String),
          to: $checkedConvert('to', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ApplyLeaveRequestToJson(ApplyLeaveRequest instance) =>
    <String, dynamic>{
      'reason': _$LeaveReasonEnumMap[instance.reason]!,
      'type': _$LeaveTypeEnumMap[instance.type]!,
      if (instance.description case final value?) 'description': value,
      'from': instance.from,
      'to': instance.to,
    };

const _$LeaveReasonEnumMap = {
  LeaveReason.sick: 'Sick',
  LeaveReason.casual: 'Casual',
  LeaveReason.other: 'Other',
  LeaveReason.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$LeaveTypeEnumMap = {
  LeaveType.firstHalf: 'First Half',
  LeaveType.secondHalf: 'Second Half',
  LeaveType.fullDay: 'Full Day',
  LeaveType.workFromHome: 'Work From Home',
  LeaveType.unknownDefaultOpenApi: 'unknown_default_open_api',
};
