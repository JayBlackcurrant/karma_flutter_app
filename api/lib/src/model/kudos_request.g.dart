// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kudos_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KudosRequest _$KudosRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'KudosRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['toEmployeeId', 'message'],
        );
        final val = KudosRequest(
          toEmployeeId:
              $checkedConvert('toEmployeeId', (v) => (v as num).toInt()),
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$KudosRequestToJson(KudosRequest instance) =>
    <String, dynamic>{
      'toEmployeeId': instance.toEmployeeId,
      'message': instance.message,
    };
