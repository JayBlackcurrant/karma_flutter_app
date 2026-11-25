import 'package:flutter/material.dart';
import 'package:karma/core/extension/context.dart';

/// Pill badge — status chips like "Pending Approval", "Monthly-Salary".
/// Pass [color] for a tinted status badge; omit it for the neutral secondary one.
class AppBadge extends StatelessWidget {
  const AppBadge({super.key, required this.label, this.color});

  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final tint = color;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: tint?.withValues(alpha: 0.12) ?? context.colors.secondary,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: context.text.medium12.copyWith(
          color: tint ?? context.colors.secondaryForeground,
        ),
      ),
    );
  }
}
