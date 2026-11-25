import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for HolidayApi
void main() {
  final instance = Api().getHolidayApi();

  group(HolidayApi, () {
    //Future<MessageResponse> addHoliday(HolidayRequest holidayRequest) async
    test('test addHoliday', () async {
      // TODO
    });

    //Future<MessageResponse> deleteHoliday(int id) async
    test('test deleteHoliday', () async {
      // TODO
    });

    //Future<List<Holiday>> getHolidays({ String startDate, String endDate }) async
    test('test getHolidays', () async {
      // TODO
    });

    //Future<Map<String, Object>> getNumberOfWorkingDays({ String startDate, String endDate }) async
    test('test getNumberOfWorkingDays', () async {
      // TODO
    });
  });
}
