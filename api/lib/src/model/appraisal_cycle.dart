//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/cycle_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appraisal_cycle.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AppraisalCycle {
  /// Returns a new [AppraisalCycle] instance.
  AppraisalCycle({
    this.id,
    this.name,
    this.cycleType,
    this.financialYear,
    this.periodStart,
    this.periodEnd,
    this.monthsInWindow,
    this.cycleCloseDate,
    this.selfAssessmentOpensOn,
    this.selfAssessmentClosesOn,
    this.status,
    this.createdAt,
    this.updatedAt,
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
    name: r'cycleType',
    required: false,
    includeIfNull: false,
  )
  String? cycleType;

  @JsonKey(
    name: r'financialYear',
    required: false,
    includeIfNull: false,
  )
  String? financialYear;

  @JsonKey(
    name: r'periodStart',
    required: false,
    includeIfNull: false,
  )
  DateTime? periodStart;

  @JsonKey(
    name: r'periodEnd',
    required: false,
    includeIfNull: false,
  )
  DateTime? periodEnd;

  @JsonKey(
    name: r'monthsInWindow',
    required: false,
    includeIfNull: false,
  )
  num? monthsInWindow;

  @JsonKey(
    name: r'cycleCloseDate',
    required: false,
    includeIfNull: false,
  )
  DateTime? cycleCloseDate;

  @JsonKey(
    name: r'selfAssessmentOpensOn',
    required: false,
    includeIfNull: false,
  )
  DateTime? selfAssessmentOpensOn;

  @JsonKey(
    name: r'selfAssessmentClosesOn',
    required: false,
    includeIfNull: false,
  )
  DateTime? selfAssessmentClosesOn;

  @JsonKey(
    name: r'status',
    required: false,
    includeIfNull: false,
    unknownEnumValue: CycleStatus.unknownDefaultOpenApi,
  )
  CycleStatus? status;

  @JsonKey(
    name: r'createdAt',
    required: false,
    includeIfNull: false,
  )
  DateTime? createdAt;

  @JsonKey(
    name: r'updatedAt',
    required: false,
    includeIfNull: false,
  )
  DateTime? updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppraisalCycle &&
          other.id == id &&
          other.name == name &&
          other.cycleType == cycleType &&
          other.financialYear == financialYear &&
          other.periodStart == periodStart &&
          other.periodEnd == periodEnd &&
          other.monthsInWindow == monthsInWindow &&
          other.cycleCloseDate == cycleCloseDate &&
          other.selfAssessmentOpensOn == selfAssessmentOpensOn &&
          other.selfAssessmentClosesOn == selfAssessmentClosesOn &&
          other.status == status &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      id.hashCode +
      name.hashCode +
      cycleType.hashCode +
      financialYear.hashCode +
      periodStart.hashCode +
      periodEnd.hashCode +
      monthsInWindow.hashCode +
      (cycleCloseDate == null ? 0 : cycleCloseDate.hashCode) +
      (selfAssessmentOpensOn == null ? 0 : selfAssessmentOpensOn.hashCode) +
      (selfAssessmentClosesOn == null ? 0 : selfAssessmentClosesOn.hashCode) +
      status.hashCode +
      createdAt.hashCode +
      updatedAt.hashCode;

  factory AppraisalCycle.fromJson(Map<String, dynamic> json) =>
      _$AppraisalCycleFromJson(json);

  Map<String, dynamic> toJson() => _$AppraisalCycleToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
