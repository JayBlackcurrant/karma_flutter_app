// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_answers_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveAnswersRequest _$SaveAnswersRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SaveAnswersRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['answers', 'submit'],
        );
        final val = SaveAnswersRequest(
          answers: $checkedConvert(
              'answers',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      AppraisalAnswer.fromJson(e as Map<String, dynamic>))
                  .toList()),
          submit: $checkedConvert('submit', (v) => v as bool),
        );
        return val;
      },
    );

Map<String, dynamic> _$SaveAnswersRequestToJson(SaveAnswersRequest instance) =>
    <String, dynamic>{
      'answers': instance.answers.map((e) => e.toJson()).toList(),
      'submit': instance.submit,
    };
