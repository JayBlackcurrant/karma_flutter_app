//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/attendance_summary.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendance_month.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AttendanceMonth {
  /// Returns a new [AttendanceMonth] instance.
  AttendanceMonth({
    this.month,
    this.label,
    this.fileName,
    this.dataUntil,
    this.uploadedBy,
    this.uploadedAt,
    this.publishedAt,
    this.emailSentAt,
    this.summary,
  });

  @JsonKey(
    name: r'month',
    required: false,
    includeIfNull: false,
  )
  String? month;

  @JsonKey(
    name: r'label',
    required: false,
    includeIfNull: false,
  )
  String? label;

  @JsonKey(
    name: r'fileName',
    required: false,
    includeIfNull: false,
  )
  String? fileName;

  @JsonKey(
    name: r'dataUntil',
    required: false,
    includeIfNull: false,
  )
  DateTime? dataUntil;

  @JsonKey(
    name: r'uploadedBy',
    required: false,
    includeIfNull: false,
  )
  String? uploadedBy;

  @JsonKey(
    name: r'uploadedAt',
    required: false,
    includeIfNull: false,
  )
  DateTime? uploadedAt;

  @JsonKey(
    name: r'publishedAt',
    required: false,
    includeIfNull: false,
  )
  DateTime? publishedAt;

  @JsonKey(
    name: r'emailSentAt',
    required: false,
    includeIfNull: false,
  )
  DateTime? emailSentAt;

  @JsonKey(
    name: r'summary',
    required: false,
    includeIfNull: false,
  )
  AttendanceSummary? summary;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceMonth &&
          other.month == month &&
          other.label == label &&
          other.fileName == fileName &&
          other.dataUntil == dataUntil &&
          other.uploadedBy == uploadedBy &&
          other.uploadedAt == uploadedAt &&
          other.publishedAt == publishedAt &&
          other.emailSentAt == emailSentAt &&
          other.summary == summary;

  @override
  int get hashCode =>
      month.hashCode +
      label.hashCode +
      (fileName == null ? 0 : fileName.hashCode) +
      (dataUntil == null ? 0 : dataUntil.hashCode) +
      (uploadedBy == null ? 0 : uploadedBy.hashCode) +
      (uploadedAt == null ? 0 : uploadedAt.hashCode) +
      (publishedAt == null ? 0 : publishedAt.hashCode) +
      (emailSentAt == null ? 0 : emailSentAt.hashCode) +
      summary.hashCode;

  factory AttendanceMonth.fromJson(Map<String, dynamic> json) =>
      _$AttendanceMonthFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceMonthToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
