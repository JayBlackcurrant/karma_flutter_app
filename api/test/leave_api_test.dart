import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for LeaveApi
void main() {
  final instance = Api().getLeaveApi();

  group(LeaveApi, () {
    //Future<MessageResponse> applyForLeave(ApplyLeaveRequest applyLeaveRequest) async
    test('test applyForLeave', () async {
      // TODO
    });

    //Future<MessageResponse> applyLeaveForUser(ApplyLeaveForUserRequest applyLeaveForUserRequest) async
    test('test applyLeaveForUser', () async {
      // TODO
    });

    //Future<MessageResponse> cancelLeave(int leaveId) async
    test('test cancelLeave', () async {
      // TODO
    });

    //Future<LeaveSummary> getLeaves() async
    test('test getLeaves', () async {
      // TODO
    });

    //Future<List<Leave>> getPastRecords({ int year }) async
    test('test getPastRecords', () async {
      // TODO
    });

    //Future<List<Leave>> getPendingLeaves() async
    test('test getPendingLeaves', () async {
      // TODO
    });

    // Approve / reject. `id` is the employee id (inferred from the web client).
    //
    //Future<MessageResponse> markLeave(int id, int leaveId, MarkLeaveRequest markLeaveRequest) async
    test('test markLeave', () async {
      // TODO
    });

    //Future<MessageResponse> refundLeave(int id) async
    test('test refundLeave', () async {
      // TODO
    });
  });
}
