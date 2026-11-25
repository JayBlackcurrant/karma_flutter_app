//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'kudos_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class KudosRequest {
  /// Returns a new [KudosRequest] instance.
  KudosRequest({
    required this.toEmployeeId,
    required this.message,
  });

  @JsonKey(
    name: r'toEmployeeId',
    required: true,
    includeIfNull: false,
  )
  int toEmployeeId;

  @JsonKey(
    name: r'message',
    required: true,
    includeIfNull: false,
  )
  String message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KudosRequest &&
          other.toEmployeeId == toEmployeeId &&
          other.message == message;

  @override
  int get hashCode => toEmployeeId.hashCode + message.hashCode;

  factory KudosRequest.fromJson(Map<String, dynamic> json) =>
      _$KudosRequestFromJson(json);

  Map<String, dynamic> toJson() => _$KudosRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
