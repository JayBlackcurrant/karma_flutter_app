// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Employee',
      json,
      ($checkedConvert) {
        final val = Employee(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          role: $checkedConvert('role', (v) => v as String?),
          gender: $checkedConvert('gender', (v) => v as String?),
          phoneNumber: $checkedConvert('phoneNumber', (v) => v as String?),
          emergencyContactNumber:
              $checkedConvert('emergencyContactNumber', (v) => v as String?),
          emergencyContactRelation:
              $checkedConvert('emergencyContactRelation', (v) => v as String?),
          bloodGroup: $checkedConvert('bloodGroup', (v) => v as String?),
          dateOfBirth: $checkedConvert('dateOfBirth',
              (v) => v == null ? null : DateTime.parse(v as String)),
          maritalStatus: $checkedConvert('maritalStatus', (v) => v as String?),
          permanentAddress:
              $checkedConvert('permanentAddress', (v) => v as String?),
          temporaryAddress:
              $checkedConvert('temporaryAddress', (v) => v as String?),
          department: $checkedConvert('department', (v) => v as String?),
          designation: $checkedConvert('designation', (v) => v as String?),
          dateOfJoining: $checkedConvert('dateOfJoining',
              (v) => v == null ? null : DateTime.parse(v as String)),
          probationPeriodEndDate: $checkedConvert('probationPeriodEndDate',
              (v) => v == null ? null : DateTime.parse(v as String)),
          totalLeaves: $checkedConvert('totalLeaves', (v) => v as num?),
          totalWfhLeaves: $checkedConvert('totalWfhLeaves', (v) => v as num?),
          status: $checkedConvert('status', (v) => v as String?),
          biometricCode:
              $checkedConvert('biometricCode', (v) => (v as num?)?.toInt()),
          isPFEnabled: $checkedConvert('isPFEnabled', (v) => v as bool?),
          isAppraisalExempt:
              $checkedConvert('isAppraisalExempt', (v) => v as bool?),
          pan: $checkedConvert('pan', (v) => v as String?),
          endDate: $checkedConvert(
              'endDate', (v) => v == null ? null : DateTime.parse(v as String)),
          equipmentDetails:
              $checkedConvert('equipmentDetails', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.email case final value?) 'email': value,
      if (instance.role case final value?) 'role': value,
      if (instance.gender case final value?) 'gender': value,
      if (instance.phoneNumber case final value?) 'phoneNumber': value,
      if (instance.emergencyContactNumber case final value?)
        'emergencyContactNumber': value,
      if (instance.emergencyContactRelation case final value?)
        'emergencyContactRelation': value,
      if (instance.bloodGroup case final value?) 'bloodGroup': value,
      if (instance.dateOfBirth?.toIso8601String() case final value?)
        'dateOfBirth': value,
      if (instance.maritalStatus case final value?) 'maritalStatus': value,
      if (instance.permanentAddress case final value?)
        'permanentAddress': value,
      if (instance.temporaryAddress case final value?)
        'temporaryAddress': value,
      if (instance.department case final value?) 'department': value,
      if (instance.designation case final value?) 'designation': value,
      if (instance.dateOfJoining?.toIso8601String() case final value?)
        'dateOfJoining': value,
      if (instance.probationPeriodEndDate?.toIso8601String() case final value?)
        'probationPeriodEndDate': value,
      if (instance.totalLeaves case final value?) 'totalLeaves': value,
      if (instance.totalWfhLeaves case final value?) 'totalWfhLeaves': value,
      if (instance.status case final value?) 'status': value,
      if (instance.biometricCode case final value?) 'biometricCode': value,
      if (instance.isPFEnabled case final value?) 'isPFEnabled': value,
      if (instance.isAppraisalExempt case final value?)
        'isAppraisalExempt': value,
      if (instance.pan case final value?) 'pan': value,
      if (instance.endDate?.toIso8601String() case final value?)
        'endDate': value,
      if (instance.equipmentDetails case final value?)
        'equipmentDetails': value,
    };
