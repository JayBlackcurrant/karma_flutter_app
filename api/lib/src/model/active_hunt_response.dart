//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'active_hunt_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ActiveHuntResponse {
  /// Returns a new [ActiveHuntResponse] instance.
  ActiveHuntResponse({
    this.hunt,
  });

  @JsonKey(
    name: r'hunt',
    required: false,
    includeIfNull: false,
  )
  Map<String, Object>? hunt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActiveHuntResponse && other.hunt == hunt;

  @override
  int get hashCode => (hunt == null ? 0 : hunt.hashCode);

  factory ActiveHuntResponse.fromJson(Map<String, dynamic> json) =>
      _$ActiveHuntResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveHuntResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
