//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/leave_type.dart';
import 'package:api/src/model/leave_reason.dart';
import 'package:api/src/model/leave_employee.dart';
import 'package:api/src/model/leave_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leave.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Leave {
  /// Returns a new [Leave] instance.
  Leave({
    this.id,
    this.from,
    this.to,
    this.reason,
    this.description,
    this.type,
    this.count,
    this.status,
    this.markedBy,
    this.isUnpaid,
    this.additionalNotes,
    this.createdAt,
    this.updatedAt,
    this.employeeId,
    this.employee,
  });

  @JsonKey(
    name: r'id',
    required: false,
    includeIfNull: false,
  )
  int? id;

  @JsonKey(
    name: r'from',
    required: false,
    includeIfNull: false,
  )
  DateTime? from;

  @JsonKey(
    name: r'to',
    required: false,
    includeIfNull: false,
  )
  DateTime? to;

  @JsonKey(
    name: r'reason',
    required: false,
    includeIfNull: false,
    unknownEnumValue: LeaveReason.unknownDefaultOpenApi,
  )
  LeaveReason? reason;

  @JsonKey(
    name: r'description',
    required: false,
    includeIfNull: false,
  )
  String? description;

  @JsonKey(
    name: r'type',
    required: false,
    includeIfNull: false,
    unknownEnumValue: LeaveType.unknownDefaultOpenApi,
  )
  LeaveType? type;

  @JsonKey(
    name: r'count',
    required: false,
    includeIfNull: false,
  )
  num? count;

  @JsonKey(
    name: r'status',
    required: false,
    includeIfNull: false,
    unknownEnumValue: LeaveStatus.unknownDefaultOpenApi,
  )
  LeaveStatus? status;

  @JsonKey(
    name: r'markedBy',
    required: false,
    includeIfNull: false,
  )
  String? markedBy;

  /// 0 or 1
  @JsonKey(
    name: r'isUnpaid',
    required: false,
    includeIfNull: false,
  )
  num? isUnpaid;

  @JsonKey(
    name: r'additionalNotes',
    required: false,
    includeIfNull: false,
  )
  String? additionalNotes;

  @JsonKey(
    name: r'createdAt',
    required: false,
    includeIfNull: false,
  )
  DateTime? createdAt;

  @JsonKey(
    name: r'updatedAt',
    required: false,
    includeIfNull: false,
  )
  DateTime? updatedAt;

  @JsonKey(
    name: r'EmployeeId',
    required: false,
    includeIfNull: false,
  )
  int? employeeId;

  @JsonKey(
    name: r'Employee',
    required: false,
    includeIfNull: false,
  )
  LeaveEmployee? employee;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Leave &&
          other.id == id &&
          other.from == from &&
          other.to == to &&
          other.reason == reason &&
          other.description == description &&
          other.type == type &&
          other.count == count &&
          other.status == status &&
          other.markedBy == markedBy &&
          other.isUnpaid == isUnpaid &&
          other.additionalNotes == additionalNotes &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt &&
          other.employeeId == employeeId &&
          other.employee == employee;

  @override
  int get hashCode =>
      id.hashCode +
      from.hashCode +
      to.hashCode +
      reason.hashCode +
      (description == null ? 0 : description.hashCode) +
      type.hashCode +
      count.hashCode +
      status.hashCode +
      (markedBy == null ? 0 : markedBy.hashCode) +
      isUnpaid.hashCode +
      (additionalNotes == null ? 0 : additionalNotes.hashCode) +
      createdAt.hashCode +
      updatedAt.hashCode +
      employeeId.hashCode +
      employee.hashCode;

  factory Leave.fromJson(Map<String, dynamic> json) => _$LeaveFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
