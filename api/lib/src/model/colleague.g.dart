// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colleague.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Colleague _$ColleagueFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Colleague',
      json,
      ($checkedConvert) {
        final val = Colleague(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ColleagueToJson(Colleague instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
    };
