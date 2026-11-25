// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeRequest _$NoticeRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'NoticeRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['title', 'description'],
        );
        final val = NoticeRequest(
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          expirationDate:
              $checkedConvert('expirationDate', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$NoticeRequestToJson(NoticeRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      if (instance.expirationDate case final value?) 'expirationDate': value,
    };
