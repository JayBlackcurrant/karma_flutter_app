//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum QuestionType {
  @JsonValue(r'LONG_TEXT')
  LONG_TEXT(r'LONG_TEXT'),
  @JsonValue(r'SHORT_TEXT')
  SHORT_TEXT(r'SHORT_TEXT'),
  @JsonValue(r'RATING_10')
  rATING10(r'RATING_10'),
  @JsonValue(r'NUMBER')
  NUMBER(r'NUMBER'),
  @JsonValue(r'SINGLE_SELECT')
  SINGLE_SELECT(r'SINGLE_SELECT'),
  @JsonValue(r'unknown_default_open_api')
  unknownDefaultOpenApi(r'unknown_default_open_api');

  const QuestionType(this.value);

  final String value;

  @override
  String toString() => value;
}
