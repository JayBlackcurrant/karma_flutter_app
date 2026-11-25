//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'event_person.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EventPerson {
  /// Returns a new [EventPerson] instance.
  EventPerson({
    this.id,
    this.name,
    this.dateOfBirth,
    this.dateOfJoining,
    this.probationPeriodEndDate,
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
    name: r'dateOfBirth',
    required: false,
    includeIfNull: false,
  )
  DateTime? dateOfBirth;

  @JsonKey(
    name: r'dateOfJoining',
    required: false,
    includeIfNull: false,
  )
  DateTime? dateOfJoining;

  @JsonKey(
    name: r'probationPeriodEndDate',
    required: false,
    includeIfNull: false,
  )
  DateTime? probationPeriodEndDate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventPerson &&
          other.id == id &&
          other.name == name &&
          other.dateOfBirth == dateOfBirth &&
          other.dateOfJoining == dateOfJoining &&
          other.probationPeriodEndDate == probationPeriodEndDate;

  @override
  int get hashCode =>
      id.hashCode +
      name.hashCode +
      (dateOfBirth == null ? 0 : dateOfBirth.hashCode) +
      (dateOfJoining == null ? 0 : dateOfJoining.hashCode) +
      (probationPeriodEndDate == null ? 0 : probationPeriodEndDate.hashCode);

  factory EventPerson.fromJson(Map<String, dynamic> json) =>
      _$EventPersonFromJson(json);

  Map<String, dynamic> toJson() => _$EventPersonToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
