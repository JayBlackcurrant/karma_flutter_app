//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/leave.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leave_summary.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LeaveSummary {
  /// Returns a new [LeaveSummary] instance.
  LeaveSummary({
    this.leaves,
    this.paidLeavesRemaining,
    this.unpaidLeavesTaken,
    this.totalLeaves,
    this.wfhleavesRemaining,
    this.totalWFHLeaves,
  });

  @JsonKey(
    name: r'leaves',
    required: false,
    includeIfNull: false,
  )
  List<Leave>? leaves;

  @JsonKey(
    name: r'paidLeavesRemaining',
    required: false,
    includeIfNull: false,
  )
  num? paidLeavesRemaining;

  @JsonKey(
    name: r'unpaidLeavesTaken',
    required: false,
    includeIfNull: false,
  )
  num? unpaidLeavesTaken;

  @JsonKey(
    name: r'totalLeaves',
    required: false,
    includeIfNull: false,
  )
  num? totalLeaves;

  @JsonKey(
    name: r'wfhleavesRemaining',
    required: false,
    includeIfNull: false,
  )
  num? wfhleavesRemaining;

  @JsonKey(
    name: r'totalWFHLeaves',
    required: false,
    includeIfNull: false,
  )
  num? totalWFHLeaves;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeaveSummary &&
          other.leaves == leaves &&
          other.paidLeavesRemaining == paidLeavesRemaining &&
          other.unpaidLeavesTaken == unpaidLeavesTaken &&
          other.totalLeaves == totalLeaves &&
          other.wfhleavesRemaining == wfhleavesRemaining &&
          other.totalWFHLeaves == totalWFHLeaves;

  @override
  int get hashCode =>
      leaves.hashCode +
      paidLeavesRemaining.hashCode +
      unpaidLeavesTaken.hashCode +
      totalLeaves.hashCode +
      wfhleavesRemaining.hashCode +
      totalWFHLeaves.hashCode;

  factory LeaveSummary.fromJson(Map<String, dynamic> json) =>
      _$LeaveSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
