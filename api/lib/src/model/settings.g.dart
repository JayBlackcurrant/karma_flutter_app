// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Settings',
      json,
      ($checkedConvert) {
        final val = Settings(
          allowPastLeaves:
              $checkedConvert('allowPastLeaves', (v) => v as bool?),
        );
        return val;
      },
    );

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      if (instance.allowPastLeaves case final value?) 'allowPastLeaves': value,
    };
