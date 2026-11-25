import 'package:api/api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/core/extension/model.dart';

/// Payload shapes captured from the live Karma API (values made up).
void main() {
  group('Notice', () {
    test('expiresOn accepts epoch ms, ISO strings and numeric strings', () {
      final ms = DateTime(2026, 12, 31).millisecondsSinceEpoch;
      expect(
        Notice.fromJson({'id': 1, 'expirationDate': ms}).expiresOn,
        DateTime(2026, 12, 31),
      );
      expect(
        Notice.fromJson({'id': 1, 'expirationDate': '2026-12-31T00:00:00.000Z'})
            .expiresOn,
        DateTime.utc(2026, 12, 31),
      );
      expect(
        Notice.fromJson({'id': 1, 'expirationDate': '$ms'}).expiresOn,
        DateTime(2026, 12, 31),
      );
      expect(Notice.fromJson({'id': 1}).expiresOn, isNull);
    });

    test('acknowledgements parse into read / not-yet groups', () {
      final acks = NoticeAcknowledgements.fromJson({
        'acknowledged': [
          {'name': 'A', 'acknowledgedOn': '2026-11-20T10:00:00.000Z'},
        ],
        'pending': [
          {'name': 'B'},
        ],
      });
      expect(acks.acknowledged!.single.name, 'A');
      expect(acks.pending!.single.acknowledgedOn, isNull);
    });
  });

  group('Kudos', () {
    final json = {
      'id': 7,
      'message': 'Thanks!',
      'createdAt': '2026-11-24T09:30:00.000Z',
      'fromEmployeeId': 3,
      'fromName': 'Asha',
      'toEmployeeId': 5,
      'toName': 'Ravi',
    };

    test('parses the wall shape', () {
      final k = Kudos.fromJson(json);
      expect(k.fromLabel, 'Asha');
      expect(k.toLabel, 'Ravi');
    });

    test('former colleagues get a fallback name', () {
      final k =
          Kudos.fromJson({...json, 'fromName': null, 'fromEmployeeId': null});
      expect(k.fromLabel, 'A former colleague');
    });

    test('only the sender or an admin can remove', () {
      final k = Kudos.fromJson(json);
      expect(k.canRemove(AuthUser(employeeId: 3, role: Role.employee)), isTrue);
      expect(
        k.canRemove(AuthUser(employeeId: 9, role: Role.employee)),
        isFalse,
      );
      expect(k.canRemove(AuthUser(employeeId: 9, role: Role.ADMIN)), isTrue);
      expect(k.canRemove(null), isFalse);
    });
  });

  test('EmployeeEvents parses the live shape', () {
    final e = EmployeeEvents.fromJson({
      'todaysBirthdays': <Object>[],
      'todaysAnniversary': <Object>[],
      'upcomingBirthdays': [
        {
          'id': 1,
          'name': 'A',
          'dateOfBirth': '1995-12-03T00:00:00.000Z',
          'dateOfJoining': '2022-01-10T00:00:00.000Z',
          'probationPeriodEndDate': '2022-07-10T00:00:00.000Z',
        },
      ],
      'upcomingAnniversary': <Object>[],
      'adminEvents': <Object>[],
    });
    expect(e.upcomingBirthdays!.single.name, 'A');
  });

  test('''AbsentEmployee exposes today's leave''', () {
    final a = AbsentEmployee.fromJson({
      'id': 2,
      'name': 'B',
      'LeaveRecords': [
        {
          'from': '2026-11-25T00:00:00.000Z',
          'to': '2026-11-25T00:00:00.000Z',
          'type': 'Second Half',
          'status': 'Requested',
        },
      ],
    });
    expect(a.todaysLeave!.type, LeaveType.secondHalf);
    expect(a.todaysLeave!.status!.label, 'Pending Approval');
  });

  test('unknown enum values do not break parsing', () {
    final a = AbsentEmployee.fromJson({
      'name': 'C',
      'LeaveRecords': [
        {'type': 'Comp Off', 'status': 'Cancelled'},
      ],
    });
    expect(a.todaysLeave!.type, LeaveType.unknownDefaultOpenApi);
  });

  group('nextOccurrence', () {
    test('birthday later this year stays this year', () {
      final now = DateTime.now();
      final later = DateTime(1990, 12, 31);
      if (now.month == 12 && now.day == 31) {
        return;
      }
      expect(later.nextOccurrence().year, now.year);
    });

    test('birthday earlier this year rolls to next year', () {
      final now = DateTime.now();
      if (now.month == 1 && now.day == 1) {
        return;
      }
      expect(
        DateTime(
          1990,
          1,
          2,
        ).nextOccurrence().year,
        now.year + 1,
      );
    });
  });
}
