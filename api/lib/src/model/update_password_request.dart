//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'update_password_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdatePasswordRequest {
  /// Returns a new [UpdatePasswordRequest] instance.
  UpdatePasswordRequest({
    required this.password,
  });

  @JsonKey(
    name: r'password',
    required: true,
    includeIfNull: false,
  )
  String password;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdatePasswordRequest && other.password == password;

  @override
  int get hashCode => password.hashCode;

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePasswordRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
