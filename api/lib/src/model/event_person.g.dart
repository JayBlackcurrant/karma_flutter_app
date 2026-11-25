// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventPerson _$EventPersonFromJson(Map<String, dynamic> json) => $checkedCreate(
      'EventPerson',
      json,
      ($checkedConvert) {
        final val = EventPerson(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
          dateOfBirth: $checkedConvert('dateOfBirth',
              (v) => v == null ? null : DateTime.parse(v as String)),
          dateOfJoining: $checkedConvert('dateOfJoining',
              (v) => v == null ? null : DateTime.parse(v as String)),
          probationPeriodEndDate: $checkedConvert('probationPeriodEndDate',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$EventPersonToJson(EventPerson instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.dateOfBirth?.toIso8601String() case final value?)
        'dateOfBirth': value,
      if (instance.dateOfJoining?.toIso8601String() case final value?)
        'dateOfJoining': value,
      if (instance.probationPeriodEndDate?.toIso8601String() case final value?)
        'probationPeriodEndDate': value,
    };
