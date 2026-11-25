//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/attendance_finding.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendance_day.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AttendanceDay {
  /// Returns a new [AttendanceDay] instance.
  AttendanceDay({
    this.date,
    this.weekday,
    this.in_,
    this.out_,
    this.minutes,
    this.status,
    this.workingDay,
    this.findings,
  });

  @JsonKey(
    name: r'date',
    required: false,
    includeIfNull: false,
  )
  DateTime? date;

  @JsonKey(
    name: r'weekday',
    required: false,
    includeIfNull: false,
  )
  String? weekday;

  @JsonKey(
    name: r'in',
    required: false,
    includeIfNull: false,
  )
  String? in_;

  @JsonKey(
    name: r'out',
    required: false,
    includeIfNull: false,
  )
  String? out_;

  @JsonKey(
    name: r'minutes',
    required: false,
    includeIfNull: false,
  )
  num? minutes;

  @JsonKey(
    name: r'status',
    required: false,
    includeIfNull: false,
  )
  String? status;

  @JsonKey(
    name: r'workingDay',
    required: false,
    includeIfNull: false,
  )
  bool? workingDay;

  @JsonKey(
    name: r'findings',
    required: false,
    includeIfNull: false,
  )
  List<AttendanceFinding>? findings;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceDay &&
          other.date == date &&
          other.weekday == weekday &&
          other.in_ == in_ &&
          other.out_ == out_ &&
          other.minutes == minutes &&
          other.status == status &&
          other.workingDay == workingDay &&
          other.findings == findings;

  @override
  int get hashCode =>
      date.hashCode +
      weekday.hashCode +
      (in_ == null ? 0 : in_.hashCode) +
      (out_ == null ? 0 : out_.hashCode) +
      (minutes == null ? 0 : minutes.hashCode) +
      status.hashCode +
      workingDay.hashCode +
      findings.hashCode;

  factory AttendanceDay.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDayFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceDayToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
