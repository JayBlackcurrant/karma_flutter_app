import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/async_value.dart';
import 'package:karma/core/extension/model.dart';
import 'package:karma/src/leaves/providers/leave_actions_provider.dart';
import 'package:karma/src/leaves/providers/leave_summary_provider.dart';
import 'package:karma/src/leaves/ui/components/leave_tile.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:karma/src/shared/components/app_confirm.dart';
import 'package:karma/src/shared/components/app_empty.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// My Leave Details: pending requests (cancellable), then reviewed ones.
class MyLeavesSection extends ConsumerWidget {
  const MyLeavesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(leaveSummaryProvider).unfold(
      onRetry: () => ref.invalidate(leaveSummaryProvider),
      (summary) {
        // Newest first, as on the web.
        final all = [...summary.leaves ?? <Leave>[]]
          ..sort((a, b) => (b.id ?? 0).compareTo(a.id ?? 0));
        final pending = all.where((l) => l.isPending).toList();
        final past = all.where((l) => !l.isPending).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppCard(
              icon: PhosphorIconsRegular.hourglassMedium,
              title: 'Pending Leaves',
              description:
                  'Your leave requests still awaiting approval, newest first.',
              child: pending.isEmpty
                  ? const AppEmpty(
                      message: 'No pending leaves. Your karma is spotless.',
                    )
                  : _List(
                      leaves: pending,
                      onCancel: (leave) => _cancel(context, ref, leave),
                    ),
            ),
            const Gap(16),
            AppCard(
              icon: PhosphorIconsRegular.clockCounterClockwise,
              title: 'Past Leaves',
              description:
                  'Leaves that have already been reviewed, newest first.',
              child: past.isEmpty
                  ? const AppEmpty(
                      message: 'No leaves taken this year. Remember, rest is '
                          'productive too.',
                    )
                  : _List(leaves: past),
            ),
          ],
        );
      },
    );
  }

  Future<void> _cancel(BuildContext context, WidgetRef ref, Leave leave) async {
    final id = leave.id;
    if (id == null) {
      return;
    }
    final yes = await showAppConfirm(
      context,
      title: 'Are you sure?',
      message: 'Do you want to cancel this leave?\n\n${leave.dateLabel}',
      confirmLabel: 'Cancel leave',
      destructive: true,
    );
    if (yes) {
      await ref.read(leaveActionsProvider.notifier).cancel(id);
    }
  }
}

class _List extends StatelessWidget {
  const _List({required this.leaves, this.onCancel});

  final List<Leave> leaves;
  final ValueChanged<Leave>? onCancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final (i, l) in leaves.indexed) ...[
          if (i > 0) const Gap(10),
          LeaveTile(
            leave: l,
            onCancel: onCancel == null ? null : () => onCancel!(l),
          ),
        ],
      ],
    );
  }
}
