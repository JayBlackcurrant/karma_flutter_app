// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absent_leave_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbsentLeaveRecord _$AbsentLeaveRecordFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AbsentLeaveRecord',
      json,
      ($checkedConvert) {
        final val = AbsentLeaveRecord(
          from: $checkedConvert(
              'from', (v) => v == null ? null : DateTime.parse(v as String)),
          to: $checkedConvert(
              'to', (v) => v == null ? null : DateTime.parse(v as String)),
          type: $checkedConvert(
              'type',
              (v) => $enumDecodeNullable(_$LeaveTypeEnumMap, v,
                  unknownValue: LeaveType.unknownDefaultOpenApi)),
          status: $checkedConvert(
              'status',
              (v) => $enumDecodeNullable(_$LeaveStatusEnumMap, v,
                  unknownValue: LeaveStatus.unknownDefaultOpenApi)),
        );
        return val;
      },
    );

Map<String, dynamic> _$AbsentLeaveRecordToJson(AbsentLeaveRecord instance) =>
    <String, dynamic>{
      if (instance.from?.toIso8601String() case final value?) 'from': value,
      if (instance.to?.toIso8601String() case final value?) 'to': value,
      if (_$LeaveTypeEnumMap[instance.type] case final value?) 'type': value,
      if (_$LeaveStatusEnumMap[instance.status] case final value?)
        'status': value,
    };

const _$LeaveTypeEnumMap = {
  LeaveType.firstHalf: 'First Half',
  LeaveType.secondHalf: 'Second Half',
  LeaveType.fullDay: 'Full Day',
  LeaveType.workFromHome: 'Work From Home',
  LeaveType.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$LeaveStatusEnumMap = {
  LeaveStatus.requested: 'Requested',
  LeaveStatus.approved: 'Approved',
  LeaveStatus.rejected: 'Rejected',
  LeaveStatus.unknownDefaultOpenApi: 'unknown_default_open_api',
};
