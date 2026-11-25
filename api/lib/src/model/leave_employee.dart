//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'leave_employee.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LeaveEmployee {
  /// Returns a new [LeaveEmployee] instance.
  LeaveEmployee({
    this.id,
    this.name,
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeaveEmployee && other.id == id && other.name == name;

  @override
  int get hashCode => id.hashCode + name.hashCode;

  factory LeaveEmployee.fromJson(Map<String, dynamic> json) =>
      _$LeaveEmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveEmployeeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
