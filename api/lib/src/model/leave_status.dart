//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum LeaveStatus {
  @JsonValue(r'Requested')
  requested(r'Requested'),
  @JsonValue(r'Approved')
  approved(r'Approved'),
  @JsonValue(r'Rejected')
  rejected(r'Rejected'),
  @JsonValue(r'unknown_default_open_api')
  unknownDefaultOpenApi(r'unknown_default_open_api');

  const LeaveStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
