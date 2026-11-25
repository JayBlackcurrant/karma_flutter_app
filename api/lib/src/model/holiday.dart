//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'holiday.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Holiday {
  /// Returns a new [Holiday] instance.
  Holiday({
    this.id,
    this.name,
    this.date,
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
    name: r'name',
    required: false,
    includeIfNull: false,
  )
  String? name;

  @JsonKey(
    name: r'date',
    required: false,
    includeIfNull: false,
  )
  DateTime? date;

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
      other is Holiday &&
          other.id == id &&
          other.name == name &&
          other.date == date &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      id.hashCode +
      name.hashCode +
      date.hashCode +
      createdAt.hashCode +
      updatedAt.hashCode;

  factory Holiday.fromJson(Map<String, dynamic> json) =>
      _$HolidayFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
