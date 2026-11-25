// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appraisal_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppraisalQuestion _$AppraisalQuestionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AppraisalQuestion',
      json,
      ($checkedConvert) {
        final val = AppraisalQuestion(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          questionKey: $checkedConvert('questionKey', (v) => v as String?),
          questionText: $checkedConvert('questionText', (v) => v as String?),
          helpText: $checkedConvert('helpText', (v) => v as String?),
          questionType: $checkedConvert(
              'questionType',
              (v) => $enumDecodeNullable(_$QuestionTypeEnumMap, v,
                  unknownValue: QuestionType.unknownDefaultOpenApi)),
          isRequired: $checkedConvert('isRequired', (v) => v as bool?),
          options: $checkedConvert('options',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$AppraisalQuestionToJson(AppraisalQuestion instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.questionKey case final value?) 'questionKey': value,
      if (instance.questionText case final value?) 'questionText': value,
      if (instance.helpText case final value?) 'helpText': value,
      if (_$QuestionTypeEnumMap[instance.questionType] case final value?)
        'questionType': value,
      if (instance.isRequired case final value?) 'isRequired': value,
      if (instance.options case final value?) 'options': value,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.LONG_TEXT: 'LONG_TEXT',
  QuestionType.SHORT_TEXT: 'SHORT_TEXT',
  QuestionType.rATING10: 'RATING_10',
  QuestionType.NUMBER: 'NUMBER',
  QuestionType.SINGLE_SELECT: 'SINGLE_SELECT',
  QuestionType.unknownDefaultOpenApi: 'unknown_default_open_api',
};
