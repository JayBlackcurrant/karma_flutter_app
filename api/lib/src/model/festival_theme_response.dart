//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/festival_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'festival_theme_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FestivalThemeResponse {
  /// Returns a new [FestivalThemeResponse] instance.
  FestivalThemeResponse({
    this.festival,
  });

  @JsonKey(
    name: r'festival',
    required: false,
    includeIfNull: false,
  )
  FestivalInfo? festival;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FestivalThemeResponse && other.festival == festival;

  @override
  int get hashCode => (festival == null ? 0 : festival.hashCode);

  factory FestivalThemeResponse.fromJson(Map<String, dynamic> json) =>
      _$FestivalThemeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FestivalThemeResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
