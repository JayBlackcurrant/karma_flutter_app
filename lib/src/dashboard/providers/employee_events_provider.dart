import 'package:api/api.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/core/extension/future.dart';
import 'package:karma/core/instances/api_client.dart';
import 'package:karma/core/utils/cache_for.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employee_events_provider.g.dart';

enum EventKind {
  birthday('Birthday'),
  anniversary('Anniversary'),
  probationEnding('Probation Ending');

  const EventKind(this.label);
  final String label;
}

/// One row of the Events tab, flattened from `GET /employee/events` the same
/// way the web does it.
typedef DashboardEvent = ({String name, EventKind kind, DateTime? date});

typedef DashboardEvents = ({
  List<DashboardEvent> today,
  List<DashboardEvent> upcoming,
  List<DashboardEvent> admin,
});

@riverpod
Future<DashboardEvents> employeeEvents(Ref ref) async {
  cacheFor(ref, const Duration(minutes: 30));
  final e = await ref
      .read(apiProvider)
      .getEmployeeApi()
      .getEmployeeEvents()
      .guard<EmployeeEvents>();

  DashboardEvent row(EventPerson p, EventKind kind, DateTime? date) =>
      (name: p.name ?? '', kind: kind, date: date);

  final upcoming = [
    for (final p in e.upcomingBirthdays ?? <EventPerson>[])
      row(p, EventKind.birthday, p.dateOfBirth),
    for (final p in e.upcomingAnniversary ?? <EventPerson>[])
      row(p, EventKind.anniversary, p.dateOfJoining),
  ]..sort((a, b) => a.date.nextOccurrence().compareTo(b.date.nextOccurrence()));

  final admin = [
    for (final p in e.adminEvents ?? <EventPerson>[])
      row(p, EventKind.probationEnding, p.probationPeriodEndDate),
  ]..sort(
      (a, b) => (a.date ?? DateTime(9999)).compareTo(b.date ?? DateTime(9999)),
    );

  return (
    today: [
      for (final p in e.todaysBirthdays ?? <EventPerson>[])
        row(p, EventKind.birthday, p.dateOfBirth),
      for (final p in e.todaysAnniversary ?? <EventPerson>[])
        row(p, EventKind.anniversary, p.dateOfJoining),
    ],
    upcoming: upcoming,
    admin: admin,
  );
}
