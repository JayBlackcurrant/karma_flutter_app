// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Leave _$LeaveFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Leave',
      json,
      ($checkedConvert) {
        final val = Leave(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          from: $checkedConvert(
              'from', (v) => v == null ? null : DateTime.parse(v as String)),
          to: $checkedConvert(
              'to', (v) => v == null ? null : DateTime.parse(v as String)),
          reason: $checkedConvert(
              'reason',
              (v) => $enumDecodeNullable(_$LeaveReasonEnumMap, v,
                  unknownValue: LeaveReason.unknownDefaultOpenApi)),
          description: $checkedConvert('description', (v) => v as String?),
          type: $checkedConvert(
              'type',
              (v) => $enumDecodeNullable(_$LeaveTypeEnumMap, v,
                  unknownValue: LeaveType.unknownDefaultOpenApi)),
          count: $checkedConvert('count', (v) => v as num?),
          status: $checkedConvert(
              'status',
              (v) => $enumDecodeNullable(_$LeaveStatusEnumMap, v,
                  unknownValue: LeaveStatus.unknownDefaultOpenApi)),
          markedBy: $checkedConvert('markedBy', (v) => v as String?),
          isUnpaid: $checkedConvert('isUnpaid', (v) => v as num?),
          additionalNotes:
              $checkedConvert('additionalNotes', (v) => v as String?),
          createdAt: $checkedConvert('createdAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          updatedAt: $checkedConvert('updatedAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          employeeId:
              $checkedConvert('EmployeeId', (v) => (v as num?)?.toInt()),
          employee: $checkedConvert(
              'Employee',
              (v) => v == null
                  ? null
                  : LeaveEmployee.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'employeeId': 'EmployeeId', 'employee': 'Employee'},
    );

Map<String, dynamic> _$LeaveToJson(Leave instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.from?.toIso8601String() case final value?) 'from': value,
      if (instance.to?.toIso8601String() case final value?) 'to': value,
      if (_$LeaveReasonEnumMap[instance.reason] case final value?)
        'reason': value,
      if (instance.description case final value?) 'description': value,
      if (_$LeaveTypeEnumMap[instance.type] case final value?) 'type': value,
      if (instance.count case final value?) 'count': value,
      if (_$LeaveStatusEnumMap[instance.status] case final value?)
        'status': value,
      if (instance.markedBy case final value?) 'markedBy': value,
      if (instance.isUnpaid case final value?) 'isUnpaid': value,
      if (instance.additionalNotes case final value?) 'additionalNotes': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'createdAt': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updatedAt': value,
      if (instance.employeeId case final value?) 'EmployeeId': value,
      if (instance.employee?.toJson() case final value?) 'Employee': value,
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

const _$LeaveStatusEnumMap = {
  LeaveStatus.requested: 'Requested',
  LeaveStatus.approved: 'Approved',
  LeaveStatus.rejected: 'Rejected',
  LeaveStatus.unknownDefaultOpenApi: 'unknown_default_open_api',
};
