// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_acknowledgement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeAcknowledgement _$NoticeAcknowledgementFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'NoticeAcknowledgement',
      json,
      ($checkedConvert) {
        final val = NoticeAcknowledgement(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
          acknowledgedOn: $checkedConvert('acknowledgedOn',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$NoticeAcknowledgementToJson(
        NoticeAcknowledgement instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.acknowledgedOn?.toIso8601String() case final value?)
        'acknowledgedOn': value,
    };
