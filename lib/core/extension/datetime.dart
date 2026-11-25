import 'package:intl/intl.dart';

extension DatetimeExt on DateTime? {
  /// 25 Nov 2026 | 10:30 AM
  String format() => _fmt('d MMM y | hh:mm a');

  /// 25 Nov 26
  String ddMy() => _fmt('d MMM yy');

  /// Nov 25, 2026 — matches the web tables.
  String mdy() => _fmt('MMM d, y');

  /// 2026-11-25 — the format Karma expects in request bodies and queries.
  String yyyymmdd() => _fmt('yyyy-MM-dd');

  /// November-2026 — pay slip / attendance month labels.
  String monthYear() => _fmt('MMMM-y');

  /// Fri 25 Dec
  String weekdayDayMonth() => _fmt('EEE d MMM');

  /// 25 November 2026
  String full() => _fmt('dd MMMM y');

  /// 10:30 AM
  String toTime() => _fmt('hh:mm a');

  String custom(String pattern) => _fmt(pattern);

  String _fmt(String pattern) {
    if (this == null) {
      return '';
    }
    return DateFormat(pattern).format(this!.toLocal());
  }

  bool isSameDay(DateTime? other) {
    if (this == null || other == null) {
      return false;
    }
    final a = this!.toLocal();
    final b = other.toLocal();
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool get isWeekend =>
      this != null &&
      (this!.weekday == DateTime.saturday || this!.weekday == DateTime.sunday);

  /// Whole days from today (local midnight) to this date. Negative if past.
  int daysFromToday() {
    if (this == null) {
      return 0;
    }
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final local = this!.toLocal();
    return DateTime(local.year, local.month, local.day)
        .difference(today)
        .inDays;
  }

  /// Next time this month/day comes round (today counts), ignoring the year.
  /// Birthdays and work anniversaries; null sorts last.
  DateTime nextOccurrence() {
    if (this == null) {
      return DateTime(9999);
    }
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final local = this!.toLocal();
    final thisYear = DateTime(now.year, local.month, local.day);
    return thisYear.isBefore(today)
        ? DateTime(now.year + 1, local.month, local.day)
        : thisYear;
  }

  String toTimeAgo() {
    if (this == null) {
      return '';
    }
    final diff = DateTime.now().difference(this!.toLocal());
    final weeks = (diff.inDays / 7).floor();
    if (weeks >= 1) {
      return weeks == 1 ? '1 week ago' : '$weeks weeks ago';
    }
    if (diff.inDays == 1) {
      return 'Yesterday';
    }
    if (diff.inDays >= 2) {
      return '${diff.inDays} days ago';
    }
    if (diff.inHours >= 1) {
      return diff.inHours == 1 ? '1 hour ago' : '${diff.inHours} hours ago';
    }
    if (diff.inMinutes >= 1) {
      return diff.inMinutes == 1
          ? '1 minute ago'
          : '${diff.inMinutes} minutes ago';
    }
    return 'Just now';
  }
}

extension GreetingExt on DateTime {
  /// "Good morning" / "Good afternoon" / "Good evening" — dashboard header.
  String get greeting => switch (hour) {
        < 12 => 'Good morning',
        < 17 => 'Good afternoon',
        _ => 'Good evening',
      };
}
