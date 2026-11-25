//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/appraisal_answer.dart';
import 'package:api/src/model/appraisal_question.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appraisal_answers.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AppraisalAnswers {
  /// Returns a new [AppraisalAnswers] instance.
  AppraisalAnswers({
    this.questions,
    this.answers,
  });

  @JsonKey(
    name: r'questions',
    required: false,
    includeIfNull: false,
  )
  List<AppraisalQuestion>? questions;

  @JsonKey(
    name: r'answers',
    required: false,
    includeIfNull: false,
  )
  List<AppraisalAnswer>? answers;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppraisalAnswers &&
          other.questions == questions &&
          other.answers == answers;

  @override
  int get hashCode => questions.hashCode + answers.hashCode;

  factory AppraisalAnswers.fromJson(Map<String, dynamic> json) =>
      _$AppraisalAnswersFromJson(json);

  Map<String, dynamic> toJson() => _$AppraisalAnswersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
