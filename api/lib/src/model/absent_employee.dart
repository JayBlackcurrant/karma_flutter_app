//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/absent_leave_record.dart';
import 'package:json_annotation/json_annotation.dart';

part 'absent_employee.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AbsentEmployee {
  /// Returns a new [AbsentEmployee] instance.
  AbsentEmployee({
    this.id,
    this.name,
    this.leaveRecords,
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
    name: r'LeaveRecords',
    required: false,
    includeIfNull: false,
  )
  List<AbsentLeaveRecord>? leaveRecords;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AbsentEmployee &&
          other.id == id &&
          other.name == name &&
          other.leaveRecords == leaveRecords;

  @override
  int get hashCode => id.hashCode + name.hashCode + leaveRecords.hashCode;

  factory AbsentEmployee.fromJson(Map<String, dynamic> json) =>
      _$AbsentEmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$AbsentEmployeeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
