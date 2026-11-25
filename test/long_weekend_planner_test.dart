// Explicit DateTime(y, m, 1) reads better than relying on defaults here.
// ignore_for_file: avoid_redundant_argument_values

import 'package:api/api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karma/src/leaves/providers/leave_draft_provider.dart';
import 'package:karma/src/leaves/utils/long_weekend_planner.dart';

Holiday h(String name, DateTime d) => Holiday(name: name, date: d);

/// Calendar used below (Jan 2027): Fri 1, Thu 7, Wed 13, Sat 16, Mon 25.
void main() {
  final now = DateTime(2026, 12, 1);

  List<LongWeekend> plan(List<Holiday> holidays) =>
      planLongWeekends(holidays, now: now);

  test('Friday holiday is a free 3-day weekend', () {
    final r = plan([h('New year', DateTime(2027, 1, 1))]).single;
    expect(r.isFree, isTrue);
    expect(r.from, DateTime(2027, 1, 1));
    expect(r.to, DateTime(2027, 1, 3));
    expect(r.totalDays, 3);
  });

  test('Monday holiday is a free 3-day weekend ending on the holiday', () {
    final r = plan([h('Republic Day', DateTime(2027, 1, 25))]).single;
    expect(r.isFree, isTrue);
    expect(r.from, DateTime(2027, 1, 23));
    expect(r.to, DateTime(2027, 1, 25));
  });

  test('Thursday holiday: take Friday, get 4 days', () {
    final r = plan([h('Fest', DateTime(2027, 1, 7))]).single;
    expect(r.leaveDays, [DateTime(2027, 1, 8)]);
    expect(r.from, DateTime(2027, 1, 7));
    expect(r.to, DateTime(2027, 1, 10));
    expect(r.totalDays, 4);
  });

  test('Wednesday holiday: tie goes to bridging backwards (web order)', () {
    final r = plan([h('Mid', DateTime(2027, 1, 13))]).single;
    expect(r.leaveDays, [DateTime(2027, 1, 11), DateTime(2027, 1, 12)]);
    expect(r.from, DateTime(2027, 1, 9));
    expect(r.to, DateTime(2027, 1, 13));
    expect(r.totalDays, 5);
  });

  test('weekend and past holidays are skipped', () {
    expect(
      plan([
        h('Sat', DateTime(2027, 1, 16)),
        h('Past', DateTime(2026, 11, 20)),
      ]),
      isEmpty,
    );
  });

  test('two holidays in one block collapse into one break with both names', () {
    final r = plan([
      h('A', DateTime(2027, 1, 7)),
      h('B', DateTime(2027, 1, 8)),
    ]).single;
    expect(r.isFree, isTrue);
    expect(r.holidayNames, containsAll(['A', 'B']));
    expect(r.totalDays, 4);
  });

  test('results are sorted by start date', () {
    final r = plan([
      h('Late', DateTime(2027, 1, 25)),
      h('Early', DateTime(2027, 1, 1)),
    ]);
    expect(r.map((e) => e.from), [DateTime(2027, 1, 1), DateTime(2027, 1, 23)]);
  });

  group('LeaveDraft.toRequest', () {
    test('sends local-midnight epoch ms like the web', () {
      final req = LeaveDraft(
        from: DateTime(2027, 1, 8, 15, 30),
        to: DateTime(2027, 1, 11),
        description: '  trip  ',
      ).toRequest();
      expect(req.from, DateTime(2027, 1, 8).millisecondsSinceEpoch);
      expect(req.to, DateTime(2027, 1, 11).millisecondsSinceEpoch);
      expect(req.description, 'trip');
    });

    test('half day uses the same day for from and to', () {
      final req = LeaveDraft(
        type: LeaveType.secondHalf,
        from: DateTime(2027, 1, 8),
        description: 'x',
      ).toRequest();
      expect(req.to, req.from);
    });
  });
}
