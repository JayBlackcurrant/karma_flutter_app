import 'package:api/api.dart';
import 'package:flutter/foundation.dart';

/// A break the planner suggests: [from]..[to] off in a row, needing
/// [leaveDays] of leave (empty = free long weekend).
@immutable
class LongWeekend {
  const LongWeekend({
    required this.holidayNames,
    required this.from,
    required this.to,
    required this.totalDays,
    required this.leaveDays,
  });

  final List<String> holidayNames;
  final DateTime from;
  final DateTime to;
  final int totalDays;
  final List<DateTime> leaveDays;

  bool get isFree => leaveDays.isEmpty;
}

/// Port of the web app's long-weekend planner.
///
/// For every upcoming weekday holiday: take the block of days off around it
/// (weekends + adjacent holidays), then see whether bridging up to [maxLeave]
/// working days on either side joins it to another off block. Keep the
/// option with the best days-off per leave day, as long as it is at least
/// [minTotal] days long. Duplicate breaks (two holidays in one block) collapse.
///
/// One deliberate difference: the web's sort comparator mixes up its two
/// operands (`b.total / (a.leave + 1) - a.total / (b.leave + 1)`); this ranks
/// by the intended `total / (leave + 1)`, then by length.
List<LongWeekend> planLongWeekends(
  List<Holiday> holidays, {
  DateTime? now,
  DateTime? until,
  int maxLeave = 2,
  int minTotal = 3,
}) {
  DateTime day(DateTime d) {
    final l = d.toLocal();
    return DateTime(l.year, l.month, l.day);
  }

  DateTime shift(DateTime d, int days) =>
      DateTime(d.year, d.month, d.day + days);
  bool weekend(DateTime d) =>
      d.weekday == DateTime.saturday || d.weekday == DateTime.sunday;

  final start = day(now ?? DateTime.now());
  final end = day(until ?? DateTime(start.year + 1, start.month, start.day));

  final namesByDay = <DateTime, List<String>>{};
  final dated = <({String name, DateTime day})>[];
  for (final h in holidays) {
    final date = h.date;
    if (date == null) {
      continue;
    }
    final d = day(date);
    final name = h.name ?? 'Holiday';
    dated.add((name: name, day: d));
    namesByDay.putIfAbsent(d, () => []).add(name);
  }

  bool off(DateTime d) => weekend(d) || namesByDay.containsKey(d);

  (DateTime, DateTime) expand(DateTime d) {
    var from = d;
    var to = d;
    while (off(shift(from, -1))) {
      from = shift(from, -1);
    }
    while (off(shift(to, 1))) {
      to = shift(to, 1);
    }
    return (from, to);
  }

  final breaks = <String, LongWeekend>{};
  for (final h in dated) {
    if (h.day.isBefore(start) || h.day.isAfter(end) || weekend(h.day)) {
      continue;
    }
    final (blockFrom, blockTo) = expand(h.day);
    final options = <({DateTime from, DateTime to, List<DateTime> leave})>[
      (from: blockFrom, to: blockTo, leave: const []),
    ];

    for (final dir in const [-1, 1]) {
      final bridge = <DateTime>[];
      var cursor = dir < 0 ? shift(blockFrom, -1) : shift(blockTo, 1);
      while (!off(cursor) && bridge.length < maxLeave) {
        bridge.add(cursor);
        cursor = shift(cursor, dir);
      }
      if (bridge.isNotEmpty && off(cursor) && !cursor.isBefore(start)) {
        final (otherFrom, otherTo) = expand(cursor);
        options.add(
          dir < 0
              ? (from: otherFrom, to: blockTo, leave: bridge.reversed.toList())
              : (from: blockFrom, to: otherTo, leave: bridge),
        );
      }
    }

    int total(({DateTime from, DateTime to, List<DateTime> leave}) o) =>
        o.to.difference(o.from).inDays + 1;
    double score(({DateTime from, DateTime to, List<DateTime> leave}) o) =>
        total(o) / (o.leave.length + 1);

    // Ties keep insertion order (as JS's stable sort does on the web): the
    // plain block first, then bridging backwards, then forwards.
    final viable = [
      for (final (i, o) in options.indexed)
        if (total(o) >= minTotal && o.leave.every((d) => !d.isBefore(start)))
          (i: i, o: o),
    ]..sort((a, b) {
        final byScore = score(b.o).compareTo(score(a.o));
        if (byScore != 0) {
          return byScore;
        }
        final byTotal = total(b.o).compareTo(total(a.o));
        return byTotal != 0 ? byTotal : a.i.compareTo(b.i);
      });
    if (viable.isEmpty) {
      continue;
    }
    final best = viable.first.o;
    final key = '${best.from}_${best.to}';
    if (breaks.containsKey(key)) {
      continue;
    }

    final names = <String>{};
    for (var d = best.from; !d.isAfter(best.to); d = shift(d, 1)) {
      names.addAll(namesByDay[d] ?? const []);
    }
    breaks[key] = LongWeekend(
      holidayNames: names.toList(),
      from: best.from,
      to: best.to,
      totalDays: total(best),
      leaveDays: best.leave,
    );
  }

  return breaks.values.toList()..sort((a, b) => a.from.compareTo(b.from));
}
