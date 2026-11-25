//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'holiday_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HolidayRequest {
  /// Returns a new [HolidayRequest] instance.
  HolidayRequest({
    required this.name,
    required this.date,
  });

  @JsonKey(
    name: r'name',
    required: true,
    includeIfNull: false,
  )
  String name;

  /// YYYY-MM-DD
  @JsonKey(
    name: r'date',
    required: true,
    includeIfNull: false,
  )
  String date;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HolidayRequest && other.name == name && other.date == date;

  @override
  int get hashCode => name.hashCode + date.hashCode;

  factory HolidayRequest.fromJson(Map<String, dynamic> json) =>
      _$HolidayRequestFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
