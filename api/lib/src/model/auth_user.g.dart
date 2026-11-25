// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUser _$AuthUserFromJson(Map<String, dynamic> json) => $checkedCreate(
      'AuthUser',
      json,
      ($checkedConvert) {
        final val = AuthUser(
          employeeId:
              $checkedConvert('employeeId', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          role: $checkedConvert(
              'role',
              (v) => $enumDecodeNullable(_$RoleEnumMap, v,
                  unknownValue: Role.unknownDefaultOpenApi)),
          iat: $checkedConvert('iat', (v) => (v as num?)?.toInt()),
          exp: $checkedConvert('exp', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$AuthUserToJson(AuthUser instance) => <String, dynamic>{
      if (instance.employeeId case final value?) 'employeeId': value,
      if (instance.name case final value?) 'name': value,
      if (instance.email case final value?) 'email': value,
      if (_$RoleEnumMap[instance.role] case final value?) 'role': value,
      if (instance.iat case final value?) 'iat': value,
      if (instance.exp case final value?) 'exp': value,
    };

const _$RoleEnumMap = {
  Role.employee: 'Employee',
  Role.ADMIN: 'ADMIN',
  Role.unknownDefaultOpenApi: 'unknown_default_open_api',
};
