// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_acknowledgements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeAcknowledgements _$NoticeAcknowledgementsFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'NoticeAcknowledgements',
      json,
      ($checkedConvert) {
        final val = NoticeAcknowledgements(
          acknowledged: $checkedConvert(
              'acknowledged',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      NoticeAcknowledgement.fromJson(e as Map<String, dynamic>))
                  .toList()),
          pending: $checkedConvert(
              'pending',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      NoticeAcknowledgement.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$NoticeAcknowledgementsToJson(
        NoticeAcknowledgements instance) =>
    <String, dynamic>{
      if (instance.acknowledged?.map((e) => e.toJson()).toList()
          case final value?)
        'acknowledged': value,
      if (instance.pending?.map((e) => e.toJson()).toList() case final value?)
        'pending': value,
    };
