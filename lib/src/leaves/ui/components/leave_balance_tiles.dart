import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/async_value.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/num.dart';
import 'package:karma/src/leaves/providers/leave_summary_provider.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:karma/src/shared/components/app_loader.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Leaves Remaining · WFH Leaves Remaining · Unpaid Leaves Taken.
class LeaveBalanceTiles extends ConsumerWidget {
  const LeaveBalanceTiles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(leaveSummaryProvider).unfold(
          loading: const SizedBox(height: 92, child: AppLoader.small()),
          onRetry: () => ref.invalidate(leaveSummaryProvider),
          (s) => Row(
            children: [
              Expanded(
                child: _Tile(
                  icon: PhosphorIconsRegular.calendarBlank,
                  value: (s.paidLeavesRemaining ?? 0).compact,
                  label: 'Leaves Remaining',
                ),
              ),
              const Gap(8),
              Expanded(
                child: _Tile(
                  icon: PhosphorIconsRegular.clock,
                  value: (s.wfhleavesRemaining ?? 0).compact,
                  label: 'WFH Remaining',
                ),
              ),
              const Gap(8),
              Expanded(
                child: _Tile(
                  icon: PhosphorIconsRegular.wallet,
                  value: (s.unpaidLeavesTaken ?? 0).compact,
                  label: 'Unpaid Taken',
                ),
              ),
            ],
          ),
        );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({required this.icon, required this.value, required this.label});

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: context.colors.mutedForeground),
          const Gap(8),
          Text(value, style: context.text.bold24),
          Text(
            label,
            style: context.text.muted12,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
