import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/snack_bar_type.dart';

enum SnackBarType { success, error, warning, info }

/// Sonner-style toast (the web app uses ngx-sonner). Shown via `'…'.toToast()`.
class AppSnackbar extends StatelessWidget {
  const AppSnackbar({
    super.key,
    required this.text,
    this.type = SnackBarType.success,
  });

  final String text;
  final SnackBarType type;

  @override
  Widget build(BuildContext context) {
    final color = type.colors;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: color.bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0x1AFFFFFF)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(color.icon, size: 20, color: color.iconColor),
          const Gap(10),
          Flexible(
            child: Text(
              text,
              style: context.text.medium14.copyWith(color: color.textColor),
            ),
          ),
        ],
      ),
    );
  }
}
