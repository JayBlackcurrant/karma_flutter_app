import 'package:flutter/material.dart';
import 'package:karma/src/shared/components/app_snack_bar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

extension SnackBarTypeExt on SnackBarType {
  ({
    Color bgColor,
    Color textColor,
    Color iconColor,
    IconData icon,
  }) get colors => switch (this) {
        SnackBarType.success => (
            bgColor: const Color(0xFF18181B),
            textColor: const Color(0xFFFAFAFA),
            iconColor: const Color(0xFF10B981),
            icon: PhosphorIconsFill.checkCircle,
          ),
        SnackBarType.error => (
            bgColor: const Color(0xFF18181B),
            textColor: const Color(0xFFFAFAFA),
            iconColor: const Color(0xFFFF6467),
            icon: PhosphorIconsFill.warningCircle,
          ),
        SnackBarType.warning => (
            bgColor: const Color(0xFF18181B),
            textColor: const Color(0xFFFAFAFA),
            iconColor: const Color(0xFFF59E0B),
            icon: PhosphorIconsFill.warning,
          ),
        SnackBarType.info => (
            bgColor: const Color(0xFF18181B),
            textColor: const Color(0xFFFAFAFA),
            iconColor: const Color(0xFF9F9FA9),
            icon: PhosphorIconsFill.info,
          ),
      };
}
