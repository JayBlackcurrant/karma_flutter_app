import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/core/extension/model.dart';
import 'package:karma/core/extension/num.dart';
import 'package:karma/core/extension/string.dart';
import 'package:karma/src/shared/components/app_badge.dart';
import 'package:karma/src/shared/components/app_button.dart';

/// One leave request — the web table row as a card:
/// dates · type · status, then reason / description / count / notes.
class LeaveTile extends StatelessWidget {
  const LeaveTile({super.key, required this.leave, this.onCancel});

  final Leave leave;

  /// Shown for pending requests only.
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final status = leave.status;
    final notes = leave.additionalNotes;
    final count = leave.displayCount;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: c.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(leave.dateLabel, style: context.text.semibold14),
              ),
              if (status != null)
                AppBadge(label: status.label, color: status.color(context)),
            ],
          ),
          const Gap(6),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: [
              if (leave.type case final LeaveType t) AppBadge(label: t.label),
              if (leave.reason case final LeaveReason r)
                AppBadge(label: r.label),
              AppBadge(
                label: '${count.compact} ${count == 1 ? 'day' : 'days'}',
              ),
              if (leave.unpaid) AppBadge(label: 'Unpaid', color: c.warning),
            ],
          ),
          if (leave.description.isNotNullOrEmpty) ...[
            const Gap(8),
            Text(leave.description!, style: context.text.regular14),
          ],
          if (notes.isNotNullOrEmpty && notes != '-') ...[
            const Gap(6),
            Text('Note: $notes', style: context.text.muted12),
          ],
          if (!leave.isPending && leave.updatedAt != null) ...[
            const Gap(4),
            Text(
              'Marked ${leave.updatedAt.mdy()}'
              '${leave.markedBy.isNotNullOrEmpty ? ' by ${leave.markedBy}' : ''}',
              style: context.text.muted12,
            ),
          ],
          if (onCancel != null) ...[
            const Gap(10),
            Align(
              alignment: Alignment.centerRight,
              child:
                  AppButton.destructive(label: 'Cancel', onPressed: onCancel),
            ),
          ],
        ],
      ),
    );
  }
}
