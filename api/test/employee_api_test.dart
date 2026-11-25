import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for EmployeeApi
void main() {
  final instance = Api().getEmployeeApi();

  group(EmployeeApi, () {
    //Future<MessageResponse> createEmployee(Employee employee) async
    test('test createEmployee', () async {
      // TODO
    });

    //Future<MessageResponse> editEmployee(int id, Employee employee) async
    test('test editEmployee', () async {
      // TODO
    });

    //Future<List<AbsentEmployee>> getAbsentEmployees() async
    test('test getAbsentEmployees', () async {
      // TODO
    });

    //Future<List<Employee>> getAllEmployeeDetails() async
    test('test getAllEmployeeDetails', () async {
      // TODO
    });

    //Future<Employee> getEmployeeDetails(int id) async
    test('test getEmployeeDetails', () async {
      // TODO
    });

    //Future<EmployeeEvents> getEmployeeEvents() async
    test('test getEmployeeEvents', () async {
      // TODO
    });
  });
}
