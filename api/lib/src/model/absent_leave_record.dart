//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/leave_type.dart';
import 'package:api/src/model/leave_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'absent_leave_record.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AbsentLeaveRecord {
  /// Returns a new [AbsentLeaveRecord] instance.
  AbsentLeaveRecord({
    this.from,
    this.to,
    this.type,
    this.status,
  });

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
    name: r'type',
    required: false,
    includeIfNull: false,
    unknownEnumValue: LeaveType.unknownDefaultOpenApi,
  )
  LeaveType? type;

  @JsonKey(
    name: r'status',
    required: false,
    includeIfNull: false,
    unknownEnumValue: LeaveStatus.unknownDefaultOpenApi,
  )
  LeaveStatus? status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AbsentLeaveRecord &&
          other.from == from &&
          other.to == to &&
          other.type == type &&
          other.status == status;

  @override
  int get hashCode =>
      from.hashCode + to.hashCode + type.hashCode + status.hashCode;

  factory AbsentLeaveRecord.fromJson(Map<String, dynamic> json) =>
      _$AbsentLeaveRecordFromJson(json);

  Map<String, dynamic> toJson() => _$AbsentLeaveRecordToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
