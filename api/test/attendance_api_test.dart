import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for AttendanceApi
void main() {
  final instance = Api().getAttendanceApi();

  group(AttendanceApi, () {
    //Future<List<AttendanceMonth>> getMyMonths() async
    test('test getMyMonths', () async {
      // TODO
    });

    //Future<AttendanceReport> getMyReport(String month) async
    test('test getMyReport', () async {
      // TODO
    });
  });
}
