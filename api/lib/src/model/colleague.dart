//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'colleague.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Colleague {
  /// Returns a new [Colleague] instance.
  Colleague({
    this.id,
    this.name,
  });

  @JsonKey(
    name: r'id',
    required: false,
    includeIfNull: false,
  )
  int? id;

  @JsonKey(
    name: r'name',
    required: false,
    includeIfNull: false,
  )
  String? name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Colleague && other.id == id && other.name == name;

  @override
  int get hashCode => id.hashCode + name.hashCode;

  factory Colleague.fromJson(Map<String, dynamic> json) =>
      _$ColleagueFromJson(json);

  Map<String, dynamic> toJson() => _$ColleagueToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
