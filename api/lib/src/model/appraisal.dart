//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/appraisal_cycle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appraisal.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Appraisal {
  /// Returns a new [Appraisal] instance.
  Appraisal({
    this.id,
    this.appraisalCycleId,
    this.employeeId,
    this.employeeName,
    this.state,
    this.selfSubmittedOn,
    this.eligibleForBonus,
    this.averageRawRating,
    this.finalBonus,
    this.appraisalCycle,
  });

  @JsonKey(
    name: r'id',
    required: false,
    includeIfNull: false,
  )
  int? id;

  @JsonKey(
    name: r'AppraisalCycleId',
    required: false,
    includeIfNull: false,
  )
  int? appraisalCycleId;

  @JsonKey(
    name: r'EmployeeId',
    required: false,
    includeIfNull: false,
  )
  int? employeeId;

  @JsonKey(
    name: r'employeeName',
    required: false,
    includeIfNull: false,
  )
  String? employeeName;

  @JsonKey(
    name: r'state',
    required: false,
    includeIfNull: false,
  )
  String? state;

  @JsonKey(
    name: r'selfSubmittedOn',
    required: false,
    includeIfNull: false,
  )
  DateTime? selfSubmittedOn;

  @JsonKey(
    name: r'eligibleForBonus',
    required: false,
    includeIfNull: false,
  )
  bool? eligibleForBonus;

  @JsonKey(
    name: r'averageRawRating',
    required: false,
    includeIfNull: false,
  )
  num? averageRawRating;

  @JsonKey(
    name: r'finalBonus',
    required: false,
    includeIfNull: false,
  )
  num? finalBonus;

  @JsonKey(
    name: r'AppraisalCycle',
    required: false,
    includeIfNull: false,
  )
  AppraisalCycle? appraisalCycle;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Appraisal &&
          other.id == id &&
          other.appraisalCycleId == appraisalCycleId &&
          other.employeeId == employeeId &&
          other.employeeName == employeeName &&
          other.state == state &&
          other.selfSubmittedOn == selfSubmittedOn &&
          other.eligibleForBonus == eligibleForBonus &&
          other.averageRawRating == averageRawRating &&
          other.finalBonus == finalBonus &&
          other.appraisalCycle == appraisalCycle;

  @override
  int get hashCode =>
      id.hashCode +
      appraisalCycleId.hashCode +
      employeeId.hashCode +
      employeeName.hashCode +
      state.hashCode +
      (selfSubmittedOn == null ? 0 : selfSubmittedOn.hashCode) +
      (eligibleForBonus == null ? 0 : eligibleForBonus.hashCode) +
      (averageRawRating == null ? 0 : averageRawRating.hashCode) +
      (finalBonus == null ? 0 : finalBonus.hashCode) +
      appraisalCycle.hashCode;

  factory Appraisal.fromJson(Map<String, dynamic> json) =>
      _$AppraisalFromJson(json);

  Map<String, dynamic> toJson() => _$AppraisalToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
