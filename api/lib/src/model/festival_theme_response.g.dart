// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'festival_theme_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FestivalThemeResponse _$FestivalThemeResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'FestivalThemeResponse',
      json,
      ($checkedConvert) {
        final val = FestivalThemeResponse(
          festival: $checkedConvert(
              'festival',
              (v) => v == null
                  ? null
                  : FestivalInfo.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$FestivalThemeResponseToJson(
        FestivalThemeResponse instance) =>
    <String, dynamic>{
      if (instance.festival?.toJson() case final value?) 'festival': value,
    };
