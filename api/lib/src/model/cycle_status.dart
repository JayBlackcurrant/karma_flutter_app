//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum CycleStatus {
  @JsonValue(r'Draft')
  draft(r'Draft'),
  @JsonValue(r'Self Assessment Open')
  selfAssessmentOpen(r'Self Assessment Open'),
  @JsonValue(r'Self Assessment Closed')
  selfAssessmentClosed(r'Self Assessment Closed'),
  @JsonValue(r'Rating')
  rating(r'Rating'),
  @JsonValue(r'Calculated')
  calculated(r'Calculated'),
  @JsonValue(r'Locked')
  locked(r'Locked'),
  @JsonValue(r'Paid')
  paid(r'Paid'),
  @JsonValue(r'unknown_default_open_api')
  unknownDefaultOpenApi(r'unknown_default_open_api');

  const CycleStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
