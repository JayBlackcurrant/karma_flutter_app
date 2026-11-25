//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'attendance_summary.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AttendanceSummary {
  /// Returns a new [AttendanceSummary] instance.
  AttendanceSummary({
    this.workingDays,
    this.presentDays,
    this.wfhDays,
    this.leaveDays,
    this.holidays,
    this.totalMinutes,
    this.averageMinutes,
    this.late_,
    this.short,
    this.missingPunch,
    this.unexplained,
    this.pendingLeave,
    this.kudos,
    this.warnings,
    this.notes,
    this.excused,
  });

  @JsonKey(
    name: r'workingDays',
    required: false,
    includeIfNull: false,
  )
  num? workingDays;

  @JsonKey(
    name: r'presentDays',
    required: false,
    includeIfNull: false,
  )
  num? presentDays;

  @JsonKey(
    name: r'wfhDays',
    required: false,
    includeIfNull: false,
  )
  num? wfhDays;

  @JsonKey(
    name: r'leaveDays',
    required: false,
    includeIfNull: false,
  )
  num? leaveDays;

  @JsonKey(
    name: r'holidays',
    required: false,
    includeIfNull: false,
  )
  num? holidays;

  @JsonKey(
    name: r'totalMinutes',
    required: false,
    includeIfNull: false,
  )
  num? totalMinutes;

  @JsonKey(
    name: r'averageMinutes',
    required: false,
    includeIfNull: false,
  )
  num? averageMinutes;

  @JsonKey(
    name: r'late',
    required: false,
    includeIfNull: false,
  )
  num? late_;

  @JsonKey(
    name: r'short',
    required: false,
    includeIfNull: false,
  )
  num? short;

  @JsonKey(
    name: r'missingPunch',
    required: false,
    includeIfNull: false,
  )
  num? missingPunch;

  @JsonKey(
    name: r'unexplained',
    required: false,
    includeIfNull: false,
  )
  num? unexplained;

  @JsonKey(
    name: r'pendingLeave',
    required: false,
    includeIfNull: false,
  )
  num? pendingLeave;

  @JsonKey(
    name: r'kudos',
    required: false,
    includeIfNull: false,
  )
  num? kudos;

  @JsonKey(
    name: r'warnings',
    required: false,
    includeIfNull: false,
  )
  num? warnings;

  @JsonKey(
    name: r'notes',
    required: false,
    includeIfNull: false,
  )
  num? notes;

  @JsonKey(
    name: r'excused',
    required: false,
    includeIfNull: false,
  )
  num? excused;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceSummary &&
          other.workingDays == workingDays &&
          other.presentDays == presentDays &&
          other.wfhDays == wfhDays &&
          other.leaveDays == leaveDays &&
          other.holidays == holidays &&
          other.totalMinutes == totalMinutes &&
          other.averageMinutes == averageMinutes &&
          other.late_ == late_ &&
          other.short == short &&
          other.missingPunch == missingPunch &&
          other.unexplained == unexplained &&
          other.pendingLeave == pendingLeave &&
          other.kudos == kudos &&
          other.warnings == warnings &&
          other.notes == notes &&
          other.excused == excused;

  @override
  int get hashCode =>
      workingDays.hashCode +
      presentDays.hashCode +
      wfhDays.hashCode +
      leaveDays.hashCode +
      holidays.hashCode +
      totalMinutes.hashCode +
      averageMinutes.hashCode +
      late_.hashCode +
      short.hashCode +
      missingPunch.hashCode +
      unexplained.hashCode +
      pendingLeave.hashCode +
      kudos.hashCode +
      warnings.hashCode +
      notes.hashCode +
      excused.hashCode;

  factory AttendanceSummary.fromJson(Map<String, dynamic> json) =>
      _$AttendanceSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
