//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/leave_type.dart';
import 'package:api/src/model/leave_reason.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apply_leave_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ApplyLeaveRequest {
  /// Returns a new [ApplyLeaveRequest] instance.
  ApplyLeaveRequest({
    required this.reason,
    required this.type,
    this.description,
    required this.from,
    required this.to,
  });

  @JsonKey(
    name: r'reason',
    required: true,
    includeIfNull: false,
    unknownEnumValue: LeaveReason.unknownDefaultOpenApi,
  )
  LeaveReason reason;

  @JsonKey(
    name: r'type',
    required: true,
    includeIfNull: false,
    unknownEnumValue: LeaveType.unknownDefaultOpenApi,
  )
  LeaveType type;

  @JsonKey(
    name: r'description',
    required: false,
    includeIfNull: false,
  )
  String? description;

  /// YYYY-MM-DD
  @JsonKey(
    name: r'from',
    required: true,
    includeIfNull: false,
  )
  String from;

  /// YYYY-MM-DD
  @JsonKey(
    name: r'to',
    required: true,
    includeIfNull: false,
  )
  String to;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplyLeaveRequest &&
          other.reason == reason &&
          other.type == type &&
          other.description == description &&
          other.from == from &&
          other.to == to;

  @override
  int get hashCode =>
      reason.hashCode +
      type.hashCode +
      description.hashCode +
      from.hashCode +
      to.hashCode;

  factory ApplyLeaveRequest.fromJson(Map<String, dynamic> json) =>
      _$ApplyLeaveRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyLeaveRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
