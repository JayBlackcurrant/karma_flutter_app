// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appraisal_answers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppraisalAnswers _$AppraisalAnswersFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AppraisalAnswers',
      json,
      ($checkedConvert) {
        final val = AppraisalAnswers(
          questions: $checkedConvert(
              'questions',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      AppraisalQuestion.fromJson(e as Map<String, dynamic>))
                  .toList()),
          answers: $checkedConvert(
              'answers',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      AppraisalAnswer.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$AppraisalAnswersToJson(AppraisalAnswers instance) =>
    <String, dynamic>{
      if (instance.questions?.map((e) => e.toJson()).toList() case final value?)
        'questions': value,
      if (instance.answers?.map((e) => e.toJson()).toList() case final value?)
        'answers': value,
    };
