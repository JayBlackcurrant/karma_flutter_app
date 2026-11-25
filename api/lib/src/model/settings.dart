//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'settings.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Settings {
  /// Returns a new [Settings] instance.
  Settings({
    this.allowPastLeaves,
  });

  @JsonKey(
    name: r'allowPastLeaves',
    required: false,
    includeIfNull: false,
  )
  bool? allowPastLeaves;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Settings && other.allowPastLeaves == allowPastLeaves;

  @override
  int get hashCode => allowPastLeaves.hashCode;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
