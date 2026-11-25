//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Employee {
  /// Returns a new [Employee] instance.
  Employee({
    this.id,
    this.name,
    this.email,
    this.role,
    this.gender,
    this.phoneNumber,
    this.emergencyContactNumber,
    this.emergencyContactRelation,
    this.bloodGroup,
    this.dateOfBirth,
    this.maritalStatus,
    this.permanentAddress,
    this.temporaryAddress,
    this.department,
    this.designation,
    this.dateOfJoining,
    this.probationPeriodEndDate,
    this.totalLeaves,
    this.totalWfhLeaves,
    this.status,
    this.biometricCode,
    this.isPFEnabled,
    this.isAppraisalExempt,
    this.pan,
    this.endDate,
    this.equipmentDetails,
  });

  @JsonKey(
    name: r'id',
    required: false,
    includeIfNull: false,
  )
  int? id;

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
  )
  String? role;

  @JsonKey(
    name: r'gender',
    required: false,
    includeIfNull: false,
  )
  String? gender;

  @JsonKey(
    name: r'phoneNumber',
    required: false,
    includeIfNull: false,
  )
  String? phoneNumber;

  @JsonKey(
    name: r'emergencyContactNumber',
    required: false,
    includeIfNull: false,
  )
  String? emergencyContactNumber;

  @JsonKey(
    name: r'emergencyContactRelation',
    required: false,
    includeIfNull: false,
  )
  String? emergencyContactRelation;

  @JsonKey(
    name: r'bloodGroup',
    required: false,
    includeIfNull: false,
  )
  String? bloodGroup;

  @JsonKey(
    name: r'dateOfBirth',
    required: false,
    includeIfNull: false,
  )
  DateTime? dateOfBirth;

  @JsonKey(
    name: r'maritalStatus',
    required: false,
    includeIfNull: false,
  )
  String? maritalStatus;

  @JsonKey(
    name: r'permanentAddress',
    required: false,
    includeIfNull: false,
  )
  String? permanentAddress;

  @JsonKey(
    name: r'temporaryAddress',
    required: false,
    includeIfNull: false,
  )
  String? temporaryAddress;

  @JsonKey(
    name: r'department',
    required: false,
    includeIfNull: false,
  )
  String? department;

  @JsonKey(
    name: r'designation',
    required: false,
    includeIfNull: false,
  )
  String? designation;

  @JsonKey(
    name: r'dateOfJoining',
    required: false,
    includeIfNull: false,
  )
  DateTime? dateOfJoining;

  @JsonKey(
    name: r'probationPeriodEndDate',
    required: false,
    includeIfNull: false,
  )
  DateTime? probationPeriodEndDate;

  @JsonKey(
    name: r'totalLeaves',
    required: false,
    includeIfNull: false,
  )
  num? totalLeaves;

  @JsonKey(
    name: r'totalWfhLeaves',
    required: false,
    includeIfNull: false,
  )
  num? totalWfhLeaves;

  @JsonKey(
    name: r'status',
    required: false,
    includeIfNull: false,
  )
  String? status;

  @JsonKey(
    name: r'biometricCode',
    required: false,
    includeIfNull: false,
  )
  int? biometricCode;

  @JsonKey(
    name: r'isPFEnabled',
    required: false,
    includeIfNull: false,
  )
  bool? isPFEnabled;

  @JsonKey(
    name: r'isAppraisalExempt',
    required: false,
    includeIfNull: false,
  )
  bool? isAppraisalExempt;

  @JsonKey(
    name: r'pan',
    required: false,
    includeIfNull: false,
  )
  String? pan;

  @JsonKey(
    name: r'endDate',
    required: false,
    includeIfNull: false,
  )
  DateTime? endDate;

  @JsonKey(
    name: r'equipmentDetails',
    required: false,
    includeIfNull: false,
  )
  String? equipmentDetails;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Employee &&
          other.id == id &&
          other.name == name &&
          other.email == email &&
          other.role == role &&
          other.gender == gender &&
          other.phoneNumber == phoneNumber &&
          other.emergencyContactNumber == emergencyContactNumber &&
          other.emergencyContactRelation == emergencyContactRelation &&
          other.bloodGroup == bloodGroup &&
          other.dateOfBirth == dateOfBirth &&
          other.maritalStatus == maritalStatus &&
          other.permanentAddress == permanentAddress &&
          other.temporaryAddress == temporaryAddress &&
          other.department == department &&
          other.designation == designation &&
          other.dateOfJoining == dateOfJoining &&
          other.probationPeriodEndDate == probationPeriodEndDate &&
          other.totalLeaves == totalLeaves &&
          other.totalWfhLeaves == totalWfhLeaves &&
          other.status == status &&
          other.biometricCode == biometricCode &&
          other.isPFEnabled == isPFEnabled &&
          other.isAppraisalExempt == isAppraisalExempt &&
          other.pan == pan &&
          other.endDate == endDate &&
          other.equipmentDetails == equipmentDetails;

  @override
  int get hashCode =>
      id.hashCode +
      name.hashCode +
      email.hashCode +
      role.hashCode +
      gender.hashCode +
      phoneNumber.hashCode +
      emergencyContactNumber.hashCode +
      emergencyContactRelation.hashCode +
      bloodGroup.hashCode +
      (dateOfBirth == null ? 0 : dateOfBirth.hashCode) +
      maritalStatus.hashCode +
      permanentAddress.hashCode +
      temporaryAddress.hashCode +
      department.hashCode +
      (designation == null ? 0 : designation.hashCode) +
      (dateOfJoining == null ? 0 : dateOfJoining.hashCode) +
      (probationPeriodEndDate == null ? 0 : probationPeriodEndDate.hashCode) +
      totalLeaves.hashCode +
      totalWfhLeaves.hashCode +
      status.hashCode +
      (biometricCode == null ? 0 : biometricCode.hashCode) +
      isPFEnabled.hashCode +
      isAppraisalExempt.hashCode +
      (pan == null ? 0 : pan.hashCode) +
      (endDate == null ? 0 : endDate.hashCode) +
      (equipmentDetails == null ? 0 : equipmentDetails.hashCode);

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
