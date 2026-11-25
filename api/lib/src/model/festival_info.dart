//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'festival_info.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FestivalInfo {
  /// Returns a new [FestivalInfo] instance.
  FestivalInfo({
    this.name,
    this.theme,
  });

  @JsonKey(
    name: r'name',
    required: false,
    includeIfNull: false,
  )
  String? name;

  @JsonKey(
    name: r'theme',
    required: false,
    includeIfNull: false,
  )
  Map<String, Object>? theme;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FestivalInfo && other.name == name && other.theme == theme;

  @override
  int get hashCode => name.hashCode + theme.hashCode;

  factory FestivalInfo.fromJson(Map<String, dynamic> json) =>
      _$FestivalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FestivalInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
