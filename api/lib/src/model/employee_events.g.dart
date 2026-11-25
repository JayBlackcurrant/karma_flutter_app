// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeEvents _$EmployeeEventsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'EmployeeEvents',
      json,
      ($checkedConvert) {
        final val = EmployeeEvents(
          todaysBirthdays: $checkedConvert(
              'todaysBirthdays',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => EventPerson.fromJson(e as Map<String, dynamic>))
                  .toList()),
          todaysAnniversary: $checkedConvert(
              'todaysAnniversary',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => EventPerson.fromJson(e as Map<String, dynamic>))
                  .toList()),
          upcomingBirthdays: $checkedConvert(
              'upcomingBirthdays',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => EventPerson.fromJson(e as Map<String, dynamic>))
                  .toList()),
          upcomingAnniversary: $checkedConvert(
              'upcomingAnniversary',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => EventPerson.fromJson(e as Map<String, dynamic>))
                  .toList()),
          adminEvents: $checkedConvert(
              'adminEvents',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => EventPerson.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$EmployeeEventsToJson(EmployeeEvents instance) =>
    <String, dynamic>{
      if (instance.todaysBirthdays?.map((e) => e.toJson()).toList()
          case final value?)
        'todaysBirthdays': value,
      if (instance.todaysAnniversary?.map((e) => e.toJson()).toList()
          case final value?)
        'todaysAnniversary': value,
      if (instance.upcomingBirthdays?.map((e) => e.toJson()).toList()
          case final value?)
        'upcomingBirthdays': value,
      if (instance.upcomingAnniversary?.map((e) => e.toJson()).toList()
          case final value?)
        'upcomingAnniversary': value,
      if (instance.adminEvents?.map((e) => e.toJson()).toList()
          case final value?)
        'adminEvents': value,
    };
