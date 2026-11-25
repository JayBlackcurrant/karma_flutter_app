//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/question_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appraisal_question.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AppraisalQuestion {
  /// Returns a new [AppraisalQuestion] instance.
  AppraisalQuestion({
    this.id,
    this.questionKey,
    this.questionText,
    this.helpText,
    this.questionType,
    this.isRequired,
    this.options,
  });

  @JsonKey(
    name: r'id',
    required: false,
    includeIfNull: false,
  )
  int? id;

  @JsonKey(
    name: r'questionKey',
    required: false,
    includeIfNull: false,
  )
  String? questionKey;

  @JsonKey(
    name: r'questionText',
    required: false,
    includeIfNull: false,
  )
  String? questionText;

  @JsonKey(
    name: r'helpText',
    required: false,
    includeIfNull: false,
  )
  String? helpText;

  @JsonKey(
    name: r'questionType',
    required: false,
    includeIfNull: false,
    unknownEnumValue: QuestionType.unknownDefaultOpenApi,
  )
  QuestionType? questionType;

  @JsonKey(
    name: r'isRequired',
    required: false,
    includeIfNull: false,
  )
  bool? isRequired;

  @JsonKey(
    name: r'options',
    required: false,
    includeIfNull: false,
  )
  List<String>? options;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppraisalQuestion &&
          other.id == id &&
          other.questionKey == questionKey &&
          other.questionText == questionText &&
          other.helpText == helpText &&
          other.questionType == questionType &&
          other.isRequired == isRequired &&
          other.options == options;

  @override
  int get hashCode =>
      id.hashCode +
      (questionKey == null ? 0 : questionKey.hashCode) +
      questionText.hashCode +
      (helpText == null ? 0 : helpText.hashCode) +
      questionType.hashCode +
      isRequired.hashCode +
      (options == null ? 0 : options.hashCode);

  factory AppraisalQuestion.fromJson(Map<String, dynamic> json) =>
      _$AppraisalQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$AppraisalQuestionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
