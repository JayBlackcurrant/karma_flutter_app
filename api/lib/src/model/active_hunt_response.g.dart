// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_hunt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveHuntResponse _$ActiveHuntResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ActiveHuntResponse',
      json,
      ($checkedConvert) {
        final val = ActiveHuntResponse(
          hunt: $checkedConvert(
              'hunt',
              (v) => (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(k, e as Object),
                  )),
        );
        return val;
      },
    );

Map<String, dynamic> _$ActiveHuntResponseToJson(ActiveHuntResponse instance) =>
    <String, dynamic>{
      if (instance.hunt case final value?) 'hunt': value,
    };
