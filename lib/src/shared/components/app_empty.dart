import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Empty state with the web app's tone: "No notices. The calm before the memo."
class AppEmpty extends StatelessWidget {
  const AppEmpty({
    super.key,
    required this.message,
    this.icon = PhosphorIconsRegular.tray,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32, color: context.colors.mutedForeground),
          const Gap(8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: context.text.muted14,
          ),
        ],
      ),
    );
  }
}
