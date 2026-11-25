//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/appraisal_answer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'save_answers_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SaveAnswersRequest {
  /// Returns a new [SaveAnswersRequest] instance.
  SaveAnswersRequest({
    required this.answers,
    required this.submit,
  });

  @JsonKey(
    name: r'answers',
    required: true,
    includeIfNull: false,
  )
  List<AppraisalAnswer> answers;

  @JsonKey(
    name: r'submit',
    required: true,
    includeIfNull: false,
  )
  bool submit;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveAnswersRequest &&
          other.answers == answers &&
          other.submit == submit;

  @override
  int get hashCode => answers.hashCode + submit.hashCode;

  factory SaveAnswersRequest.fromJson(Map<String, dynamic> json) =>
      _$SaveAnswersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SaveAnswersRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
