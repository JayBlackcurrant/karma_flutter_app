//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'notice_acknowledgement.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NoticeAcknowledgement {
  /// Returns a new [NoticeAcknowledgement] instance.
  NoticeAcknowledgement({
    this.id,
    this.name,
    this.acknowledgedOn,
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

  @JsonKey(
    name: r'acknowledgedOn',
    required: false,
    includeIfNull: false,
  )
  DateTime? acknowledgedOn;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoticeAcknowledgement &&
          other.id == id &&
          other.name == name &&
          other.acknowledgedOn == acknowledgedOn;

  @override
  int get hashCode =>
      (id == null ? 0 : id.hashCode) +
      name.hashCode +
      (acknowledgedOn == null ? 0 : acknowledgedOn.hashCode);

  factory NoticeAcknowledgement.fromJson(Map<String, dynamic> json) =>
      _$NoticeAcknowledgementFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeAcknowledgementToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
