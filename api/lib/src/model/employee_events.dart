//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/event_person.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee_events.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EmployeeEvents {
  /// Returns a new [EmployeeEvents] instance.
  EmployeeEvents({
    this.todaysBirthdays,
    this.todaysAnniversary,
    this.upcomingBirthdays,
    this.upcomingAnniversary,
    this.adminEvents,
  });

  @JsonKey(
    name: r'todaysBirthdays',
    required: false,
    includeIfNull: false,
  )
  List<EventPerson>? todaysBirthdays;

  @JsonKey(
    name: r'todaysAnniversary',
    required: false,
    includeIfNull: false,
  )
  List<EventPerson>? todaysAnniversary;

  @JsonKey(
    name: r'upcomingBirthdays',
    required: false,
    includeIfNull: false,
  )
  List<EventPerson>? upcomingBirthdays;

  @JsonKey(
    name: r'upcomingAnniversary',
    required: false,
    includeIfNull: false,
  )
  List<EventPerson>? upcomingAnniversary;

  /// admin only - probations ending soon
  @JsonKey(
    name: r'adminEvents',
    required: false,
    includeIfNull: false,
  )
  List<EventPerson>? adminEvents;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeEvents &&
          other.todaysBirthdays == todaysBirthdays &&
          other.todaysAnniversary == todaysAnniversary &&
          other.upcomingBirthdays == upcomingBirthdays &&
          other.upcomingAnniversary == upcomingAnniversary &&
          other.adminEvents == adminEvents;

  @override
  int get hashCode =>
      todaysBirthdays.hashCode +
      todaysAnniversary.hashCode +
      upcomingBirthdays.hashCode +
      upcomingAnniversary.hashCode +
      adminEvents.hashCode;

  factory EmployeeEvents.fromJson(Map<String, dynamic> json) =>
      _$EmployeeEventsFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeEventsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
