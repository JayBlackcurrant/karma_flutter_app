// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'festival_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FestivalInfo _$FestivalInfoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'FestivalInfo',
      json,
      ($checkedConvert) {
        final val = FestivalInfo(
          name: $checkedConvert('name', (v) => v as String?),
          theme: $checkedConvert(
              'theme',
              (v) => (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(k, e as Object),
                  )),
        );
        return val;
      },
    );

Map<String, dynamic> _$FestivalInfoToJson(FestivalInfo instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.theme case final value?) 'theme': value,
    };
