//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum LeaveReason {
  @JsonValue(r'Sick')
  sick(r'Sick'),
  @JsonValue(r'Casual')
  casual(r'Casual'),
  @JsonValue(r'Other')
  other(r'Other'),
  @JsonValue(r'unknown_default_open_api')
  unknownDefaultOpenApi(r'unknown_default_open_api');

  const LeaveReason(this.value);

  final String value;

  @override
  String toString() => value;
}
