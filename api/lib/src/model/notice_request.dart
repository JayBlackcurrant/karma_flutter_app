//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'notice_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NoticeRequest {
  /// Returns a new [NoticeRequest] instance.
  NoticeRequest({
    required this.title,
    required this.description,
    this.expirationDate,
  });

  @JsonKey(
    name: r'title',
    required: true,
    includeIfNull: false,
  )
  String title;

  @JsonKey(
    name: r'description',
    required: true,
    includeIfNull: false,
  )
  String description;

  /// epoch ms
  @JsonKey(
    name: r'expirationDate',
    required: false,
    includeIfNull: false,
  )
  int? expirationDate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoticeRequest &&
          other.title == title &&
          other.description == description &&
          other.expirationDate == expirationDate;

  @override
  int get hashCode =>
      title.hashCode + description.hashCode + expirationDate.hashCode;

  factory NoticeRequest.fromJson(Map<String, dynamic> json) =>
      _$NoticeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
