import 'package:karma/src/leaves/providers/holidays_provider.dart';
import 'package:karma/src/leaves/utils/long_weekend_planner.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'long_weekends_provider.g.dart';

/// Long weekends over the next 12 months, from the holiday calendar.
@riverpod
Future<List<LongWeekend>> longWeekends(Ref ref) async {
  final holidays = await ref.watch(holidaysProvider.future);
  return planLongWeekends(holidays);
}

/// Holiday days (local midnight) — used to disable them in the date pickers.
@riverpod
Future<Set<DateTime>> holidayDays(Ref ref) async {
  final holidays = await ref.watch(holidaysProvider.future);
  return {
    for (final h in holidays)
      if (h.date case final DateTime d)
        DateTime(d.toLocal().year, d.toLocal().month, d.toLocal().day),
  };
}
