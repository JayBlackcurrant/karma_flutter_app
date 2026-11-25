import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:karma/core/constants/keys.dart';
import 'package:karma/src/shared/components/app_snack_bar.dart';

extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  bool get isEmail => RegExp(
        r'^(?!.*\.\.@)[a-zA-Z0-9._%+-]+(?<!\.)@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      ).hasMatch(this ?? '');

  String toTitleCase() {
    if (isNullOrEmpty) {
      return '';
    }
    return this!
        .replaceAll('_', ' ')
        .split(' ')
        .where((w) => w.isNotEmpty)
        .map((w) => w[0].toUpperCase() + w.substring(1).toLowerCase())
        .join(' ');
  }

  String toSnakeCase() =>
      (this ?? '').trim().toLowerCase().replaceAll(RegExp(r'\s+'), '_');

  /// "Jay Vishwakarma" → "JV" (avatar fallback, same rule as the web app).
  String get initials {
    final parts = (this ?? '').trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) {
      return '?';
    }
    final first = parts.first[0];
    final second = parts.length > 1 ? parts[1][0] : '';
    return (first + second).toUpperCase();
  }

  /// First word — "Good morning, Jay".
  String get firstName => (this ?? '').trim().split(RegExp(r'\s+')).first;

  /// Text that only appears in debug builds.
  String get ifDebug => kDebugMode ? this ?? '' : '';

  /// Show this string as a snack bar from anywhere (providers included).
  void toToast({SnackBarType type = SnackBarType.success, Duration? duration}) {
    if (isNullOrEmpty) {
      return;
    }
    scaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          duration: duration ?? const Duration(milliseconds: 4000),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: AppSnackbar(text: this!, type: type),
        ),
      );
  }
}
