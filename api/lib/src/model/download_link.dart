//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'download_link.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DownloadLink {
  /// Returns a new [DownloadLink] instance.
  DownloadLink({
    this.link,
  });

  @JsonKey(
    name: r'link',
    required: false,
    includeIfNull: false,
  )
  String? link;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DownloadLink && other.link == link;

  @override
  int get hashCode => link.hashCode;

  factory DownloadLink.fromJson(Map<String, dynamic> json) =>
      _$DownloadLinkFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadLinkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
