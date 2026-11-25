//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'attendance_finding.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AttendanceFinding {
  /// Returns a new [AttendanceFinding] instance.
  AttendanceFinding({
    this.type,
    this.severity,
    this.message,
    this.excused,
    this.excuseId,
    this.excuseNote,
    this.excusedBy,
  });

  @JsonKey(
    name: r'type',
    required: false,
    includeIfNull: false,
  )
  String? type;

  @JsonKey(
    name: r'severity',
    required: false,
    includeIfNull: false,
  )
  String? severity;

  @JsonKey(
    name: r'message',
    required: false,
    includeIfNull: false,
  )
  String? message;

  @JsonKey(
    name: r'excused',
    required: false,
    includeIfNull: false,
  )
  bool? excused;

  @JsonKey(
    name: r'excuseId',
    required: false,
    includeIfNull: false,
  )
  int? excuseId;

  @JsonKey(
    name: r'excuseNote',
    required: false,
    includeIfNull: false,
  )
  String? excuseNote;

  @JsonKey(
    name: r'excusedBy',
    required: false,
    includeIfNull: false,
  )
  String? excusedBy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceFinding &&
          other.type == type &&
          other.severity == severity &&
          other.message == message &&
          other.excused == excused &&
          other.excuseId == excuseId &&
          other.excuseNote == excuseNote &&
          other.excusedBy == excusedBy;

  @override
  int get hashCode =>
      type.hashCode +
      severity.hashCode +
      message.hashCode +
      excused.hashCode +
      (excuseId == null ? 0 : excuseId.hashCode) +
      (excuseNote == null ? 0 : excuseNote.hashCode) +
      (excusedBy == null ? 0 : excusedBy.hashCode);

  factory AttendanceFinding.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFindingFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceFindingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
