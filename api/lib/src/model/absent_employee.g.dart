// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absent_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbsentEmployee _$AbsentEmployeeFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AbsentEmployee',
      json,
      ($checkedConvert) {
        final val = AbsentEmployee(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
          leaveRecords: $checkedConvert(
              'LeaveRecords',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      AbsentLeaveRecord.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'leaveRecords': 'LeaveRecords'},
    );

Map<String, dynamic> _$AbsentEmployeeToJson(AbsentEmployee instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.leaveRecords?.map((e) => e.toJson()).toList()
          case final value?)
        'LeaveRecords': value,
    };
