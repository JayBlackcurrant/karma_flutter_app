//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'appraisal_answer.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AppraisalAnswer {
  /// Returns a new [AppraisalAnswer] instance.
  AppraisalAnswer({
    this.appraisalQuestionId,
    this.answerText,
    this.answerNumber,
  });

  @JsonKey(
    name: r'AppraisalQuestionId',
    required: false,
    includeIfNull: false,
  )
  int? appraisalQuestionId;

  @JsonKey(
    name: r'answerText',
    required: false,
    includeIfNull: false,
  )
  String? answerText;

  @JsonKey(
    name: r'answerNumber',
    required: false,
    includeIfNull: false,
  )
  num? answerNumber;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppraisalAnswer &&
          other.appraisalQuestionId == appraisalQuestionId &&
          other.answerText == answerText &&
          other.answerNumber == answerNumber;

  @override
  int get hashCode =>
      appraisalQuestionId.hashCode +
      (answerText == null ? 0 : answerText.hashCode) +
      (answerNumber == null ? 0 : answerNumber.hashCode);

  factory AppraisalAnswer.fromJson(Map<String, dynamic> json) =>
      _$AppraisalAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AppraisalAnswerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
