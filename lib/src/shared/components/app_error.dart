import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/src/shared/components/app_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppError extends StatelessWidget {
  const AppError({super.key, required this.err, this.onRetry});

  final String err;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              PhosphorIconsRegular.warningCircle,
              size: 32,
              color: context.colors.destructive,
            ),
            const Gap(8),
            Text(
              err,
              textAlign: TextAlign.center,
              style: context.text.regular14.copyWith(
                color: context.colors.destructive,
              ),
            ),
            if (onRetry != null) ...[
              const Gap(12),
              AppButton.outline(label: 'Try again', onPressed: onRetry),
            ],
          ],
        ),
      ),
    );
  }
}
