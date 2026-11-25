// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appraisal_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppraisalAnswer _$AppraisalAnswerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AppraisalAnswer',
      json,
      ($checkedConvert) {
        final val = AppraisalAnswer(
          appraisalQuestionId: $checkedConvert(
              'AppraisalQuestionId', (v) => (v as num?)?.toInt()),
          answerText: $checkedConvert('answerText', (v) => v as String?),
          answerNumber: $checkedConvert('answerNumber', (v) => v as num?),
        );
        return val;
      },
      fieldKeyMap: const {'appraisalQuestionId': 'AppraisalQuestionId'},
    );

Map<String, dynamic> _$AppraisalAnswerToJson(AppraisalAnswer instance) =>
    <String, dynamic>{
      if (instance.appraisalQuestionId case final value?)
        'AppraisalQuestionId': value,
      if (instance.answerText case final value?) 'answerText': value,
      if (instance.answerNumber case final value?) 'answerNumber': value,
    };
