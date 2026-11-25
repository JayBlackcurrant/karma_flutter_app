import 'package:api/api.dart';
import 'package:karma/core/extension/future.dart';
import 'package:karma/core/instances/api_client.dart';
import 'package:karma/core/utils/cache_for.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'absent_employees_provider.g.dart';

/// `GET /employee/get-absent-employees` — who is out today, including leaves
/// still awaiting approval.
@riverpod
Future<List<AbsentEmployee>> absentEmployees(Ref ref) async {
  cacheFor(ref, const Duration(minutes: 5));
  return ref
      .read(apiProvider)
      .getEmployeeApi()
      .getAbsentEmployees()
      .guard<List<AbsentEmployee>>();
}
