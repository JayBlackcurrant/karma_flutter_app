//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'notice.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Notice {
  /// Returns a new [Notice] instance.
  Notice({
    this.id,
    this.title,
    this.description,
    this.expirationDate,
    this.acknowledgedByMe,
    this.acknowledgedOn,
    this.acknowledgedCount,
    this.activeEmployeeCount,
    this.createdAt,
    this.updatedAt,
  });

  @JsonKey(
    name: r'id',
    required: false,
    includeIfNull: false,
  )
  int? id;

  @JsonKey(
    name: r'title',
    required: false,
    includeIfNull: false,
  )
  String? title;

  @JsonKey(
    name: r'description',
    required: false,
    includeIfNull: false,
  )
  String? description;

  /// ISO date string or epoch ms (sent as epoch ms) - parse with NoticeExt.expiresOn
  @JsonKey(
    name: r'expirationDate',
    required: false,
    includeIfNull: false,
  )
  Object? expirationDate;

  @JsonKey(
    name: r'acknowledgedByMe',
    required: false,
    includeIfNull: false,
  )
  bool? acknowledgedByMe;

  @JsonKey(
    name: r'acknowledgedOn',
    required: false,
    includeIfNull: false,
  )
  DateTime? acknowledgedOn;

  @JsonKey(
    name: r'acknowledgedCount',
    required: false,
    includeIfNull: false,
  )
  int? acknowledgedCount;

  /// admin only
  @JsonKey(
    name: r'activeEmployeeCount',
    required: false,
    includeIfNull: false,
  )
  int? activeEmployeeCount;

  @JsonKey(
    name: r'createdAt',
    required: false,
    includeIfNull: false,
  )
  DateTime? createdAt;

  @JsonKey(
    name: r'updatedAt',
    required: false,
    includeIfNull: false,
  )
  DateTime? updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Notice &&
          other.id == id &&
          other.title == title &&
          other.description == description &&
          other.expirationDate == expirationDate &&
          other.acknowledgedByMe == acknowledgedByMe &&
          other.acknowledgedOn == acknowledgedOn &&
          other.acknowledgedCount == acknowledgedCount &&
          other.activeEmployeeCount == activeEmployeeCount &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      id.hashCode +
      title.hashCode +
      description.hashCode +
      (expirationDate == null ? 0 : expirationDate.hashCode) +
      (acknowledgedByMe == null ? 0 : acknowledgedByMe.hashCode) +
      (acknowledgedOn == null ? 0 : acknowledgedOn.hashCode) +
      (acknowledgedCount == null ? 0 : acknowledgedCount.hashCode) +
      (activeEmployeeCount == null ? 0 : activeEmployeeCount.hashCode) +
      (createdAt == null ? 0 : createdAt.hashCode) +
      (updatedAt == null ? 0 : updatedAt.hashCode);

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
