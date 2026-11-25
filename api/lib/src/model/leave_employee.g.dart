// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveEmployee _$LeaveEmployeeFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LeaveEmployee',
      json,
      ($checkedConvert) {
        final val = LeaveEmployee(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$LeaveEmployeeToJson(LeaveEmployee instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
    };
