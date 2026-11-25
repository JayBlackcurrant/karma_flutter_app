import 'package:intl/intl.dart';

extension NumExtension on num {
  /// ₹36,000 — Indian grouping, no decimals by default.
  String toRupee([int decimal = 0]) {
    return NumberFormat.currency(
      locale: 'en_IN',
      decimalDigits: decimal,
      symbol: '₹',
    ).format(this);
  }

  /// 1,23,456 — Indian grouping without the symbol.
  String format([int decimal = 0]) {
    return NumberFormat.currency(
      locale: 'en_IN',
      decimalDigits: decimal,
      symbol: '',
    ).format(this).trim();
  }

  /// 8.75 → "8.75", 6.0 → "6" — leave balances and ratings.
  String get compact =>
      this == truncate() ? truncate().toString() : toStringAsFixed(2).replaceFirst(RegExp(r'0+$'), '');

  /// 465 → "7h 45m" — attendance minutes.
  String get minutesToHours {
    final total = round();
    final h = total ~/ 60;
    final m = total % 60;
    if (h == 0) {
      return '${m}m';
    }
    return m == 0 ? '${h}h' : '${h}h ${m}m';
  }

  /// Safe 0..1 fraction for progress rings.
  double ratioOf(num total) =>
      total <= 0 ? 0 : (this / total).clamp(0, 1).toDouble();
}
