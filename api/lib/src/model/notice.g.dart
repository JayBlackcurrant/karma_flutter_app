// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notice _$NoticeFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Notice',
      json,
      ($checkedConvert) {
        final val = Notice(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          title: $checkedConvert('title', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          expirationDate: $checkedConvert('expirationDate', (v) => v),
          acknowledgedByMe:
              $checkedConvert('acknowledgedByMe', (v) => v as bool?),
          acknowledgedOn: $checkedConvert('acknowledgedOn',
              (v) => v == null ? null : DateTime.parse(v as String)),
          acknowledgedCount:
              $checkedConvert('acknowledgedCount', (v) => (v as num?)?.toInt()),
          activeEmployeeCount: $checkedConvert(
              'activeEmployeeCount', (v) => (v as num?)?.toInt()),
          createdAt: $checkedConvert('createdAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          updatedAt: $checkedConvert('updatedAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$NoticeToJson(Notice instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.title case final value?) 'title': value,
      if (instance.description case final value?) 'description': value,
      if (instance.expirationDate case final value?) 'expirationDate': value,
      if (instance.acknowledgedByMe case final value?)
        'acknowledgedByMe': value,
      if (instance.acknowledgedOn?.toIso8601String() case final value?)
        'acknowledgedOn': value,
      if (instance.acknowledgedCount case final value?)
        'acknowledgedCount': value,
      if (instance.activeEmployeeCount case final value?)
        'activeEmployeeCount': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'createdAt': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updatedAt': value,
    };
