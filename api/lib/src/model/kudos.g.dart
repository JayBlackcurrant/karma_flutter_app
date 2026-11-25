// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kudos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kudos _$KudosFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Kudos',
      json,
      ($checkedConvert) {
        final val = Kudos(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          message: $checkedConvert('message', (v) => v as String?),
          createdAt: $checkedConvert('createdAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          fromEmployeeId:
              $checkedConvert('fromEmployeeId', (v) => (v as num?)?.toInt()),
          fromName: $checkedConvert('fromName', (v) => v as String?),
          toEmployeeId:
              $checkedConvert('toEmployeeId', (v) => (v as num?)?.toInt()),
          toName: $checkedConvert('toName', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$KudosToJson(Kudos instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.message case final value?) 'message': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'createdAt': value,
      if (instance.fromEmployeeId case final value?) 'fromEmployeeId': value,
      if (instance.fromName case final value?) 'fromName': value,
      if (instance.toEmployeeId case final value?) 'toEmployeeId': value,
      if (instance.toName case final value?) 'toName': value,
    };
