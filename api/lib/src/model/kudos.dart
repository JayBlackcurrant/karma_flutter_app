//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'kudos.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Kudos {
  /// Returns a new [Kudos] instance.
  Kudos({
    this.id,
    this.message,
    this.createdAt,
    this.fromEmployeeId,
    this.fromName,
    this.toEmployeeId,
    this.toName,
  });

  @JsonKey(
    name: r'id',
    required: false,
    includeIfNull: false,
  )
  int? id;

  @JsonKey(
    name: r'message',
    required: false,
    includeIfNull: false,
  )
  String? message;

  @JsonKey(
    name: r'createdAt',
    required: false,
    includeIfNull: false,
  )
  DateTime? createdAt;

  @JsonKey(
    name: r'fromEmployeeId',
    required: false,
    includeIfNull: false,
  )
  int? fromEmployeeId;

  /// null for a former colleague
  @JsonKey(
    name: r'fromName',
    required: false,
    includeIfNull: false,
  )
  String? fromName;

  @JsonKey(
    name: r'toEmployeeId',
    required: false,
    includeIfNull: false,
  )
  int? toEmployeeId;

  @JsonKey(
    name: r'toName',
    required: false,
    includeIfNull: false,
  )
  String? toName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Kudos &&
          other.id == id &&
          other.message == message &&
          other.createdAt == createdAt &&
          other.fromEmployeeId == fromEmployeeId &&
          other.fromName == fromName &&
          other.toEmployeeId == toEmployeeId &&
          other.toName == toName;

  @override
  int get hashCode =>
      id.hashCode +
      message.hashCode +
      createdAt.hashCode +
      (fromEmployeeId == null ? 0 : fromEmployeeId.hashCode) +
      (fromName == null ? 0 : fromName.hashCode) +
      (toEmployeeId == null ? 0 : toEmployeeId.hashCode) +
      (toName == null ? 0 : toName.hashCode);

  factory Kudos.fromJson(Map<String, dynamic> json) => _$KudosFromJson(json);

  Map<String, dynamic> toJson() => _$KudosToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
