//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum LeaveType {
  @JsonValue(r'First Half')
  firstHalf(r'First Half'),
  @JsonValue(r'Second Half')
  secondHalf(r'Second Half'),
  @JsonValue(r'Full Day')
  fullDay(r'Full Day'),
  @JsonValue(r'Work From Home')
  workFromHome(r'Work From Home'),
  @JsonValue(r'unknown_default_open_api')
  unknownDefaultOpenApi(r'unknown_default_open_api');

  const LeaveType(this.value);

  final String value;

  @override
  String toString() => value;
}
