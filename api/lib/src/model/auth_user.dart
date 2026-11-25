//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_user.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AuthUser {
  /// Returns a new [AuthUser] instance.
  AuthUser({
    this.employeeId,
    this.name,
    this.email,
    this.role,
    this.iat,
    this.exp,
  });

  @JsonKey(
    name: r'employeeId',
    required: false,
    includeIfNull: false,
  )
  int? employeeId;

  @JsonKey(
    name: r'name',
    required: false,
    includeIfNull: false,
  )
  String? name;

  @JsonKey(
    name: r'email',
    required: false,
    includeIfNull: false,
  )
  String? email;

  @JsonKey(
    name: r'role',
    required: false,
    includeIfNull: false,
    unknownEnumValue: Role.unknownDefaultOpenApi,
  )
  Role? role;

  @JsonKey(
    name: r'iat',
    required: false,
    includeIfNull: false,
  )
  int? iat;

  @JsonKey(
    name: r'exp',
    required: false,
    includeIfNull: false,
  )
  int? exp;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUser &&
          other.employeeId == employeeId &&
          other.name == name &&
          other.email == email &&
          other.role == role &&
          other.iat == iat &&
          other.exp == exp;

  @override
  int get hashCode =>
      employeeId.hashCode +
      name.hashCode +
      email.hashCode +
      role.hashCode +
      iat.hashCode +
      exp.hashCode;

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
