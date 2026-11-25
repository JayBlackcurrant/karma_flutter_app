import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for AppraisalApi
void main() {
  final instance = Api().getAppraisalApi();

  group(AppraisalApi, () {
    //Future<Appraisal> getAppraisal(int id) async
    test('test getAppraisal', () async {
      // TODO
    });

    //Future<AppraisalAnswers> getAppraisalAnswers(int id) async
    test('test getAppraisalAnswers', () async {
      // TODO
    });

    //Future<List<AppraisalCycle>> getAppraisalCycles() async
    test('test getAppraisalCycles', () async {
      // TODO
    });

    //Future<List<Appraisal>> getMyAppraisals() async
    test('test getMyAppraisals', () async {
      // TODO
    });

    //Future<Appraisal> saveAppraisalAnswers(int id, SaveAnswersRequest saveAnswersRequest) async
    test('test saveAppraisalAnswers', () async {
      // TODO
    });
  });
}
