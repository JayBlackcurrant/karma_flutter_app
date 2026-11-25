import 'package:api/api.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/core/extension/future.dart';
import 'package:karma/core/instances/api_client.dart';
import 'package:karma/core/utils/cache_for.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'holidays_provider.g.dart';

/// `GET /holiday` — the company holiday calendar, sorted by date.
@riverpod
Future<List<Holiday>> holidays(Ref ref) async {
  // Holidays change a few times a year; keep them for the session.
  cacheFor(ref, const Duration(hours: 1));
  final list = await ref
      .read(apiProvider)
      .getHolidayApi()
      .getHolidays()
      .guard<List<Holiday>>();
  return [...list]..sort((a, b) {
      final ad = a.date, bd = b.date;
      if (ad == null || bd == null) {
        return 0;
      }
      return ad.compareTo(bd);
    });
}

/// First holiday from today on, or null — dashboard countdown tile.
@riverpod
Future<Holiday?> nextHoliday(Ref ref) async {
  final list = await ref.watch(holidaysProvider.future);
  for (final h in list) {
    if (h.date.daysFromToday() >= 0) {
      return h;
    }
  }
  return null;
}
