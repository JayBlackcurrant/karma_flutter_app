//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/leave_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mark_leave_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MarkLeaveRequest {
  /// Returns a new [MarkLeaveRequest] instance.
  MarkLeaveRequest({
    required this.status,
    this.count,
    this.isUnpaid,
    this.additionalNotes,
  });

  @JsonKey(
    name: r'status',
    required: true,
    includeIfNull: false,
    unknownEnumValue: LeaveStatus.unknownDefaultOpenApi,
  )
  LeaveStatus status;

  @JsonKey(
    name: r'count',
    required: false,
    includeIfNull: false,
  )
  num? count;

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarkLeaveRequest &&
          other.status == status &&
          other.count == count &&
          other.isUnpaid == isUnpaid &&
          other.additionalNotes == additionalNotes;

  @override
  int get hashCode =>
      status.hashCode +
      count.hashCode +
      isUnpaid.hashCode +
      additionalNotes.hashCode;

  factory MarkLeaveRequest.fromJson(Map<String, dynamic> json) =>
      _$MarkLeaveRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MarkLeaveRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
