import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/core/extension/model.dart';
import 'package:karma/src/dashboard/providers/notices_provider.dart';
import 'package:karma/src/dashboard/ui/components/acknowledgements_sheet.dart';
import 'package:karma/src/dashboard/ui/components/notice_form_sheet.dart';
import 'package:karma/src/shared/components/app_button.dart';
import 'package:karma/src/shared/components/app_confirm.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NoticeTile extends ConsumerWidget {
  const NoticeTile({super.key, required this.notice, required this.isAdmin});

  final Notice notice;
  final bool isAdmin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final notifier = ref.read(noticesProvider.notifier);
    final expires = notice.expiresOn;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: c.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(notice.title ?? '', style: context.text.semibold16),
          const Gap(4),
          Text(
            notice.description ?? '',
            style: context.text.regular14.copyWith(color: c.mutedForeground),
          ),
          const Gap(12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (notice.isAcknowledged)
                _AcknowledgedChip(on: notice.acknowledgedOn)
              else
                AppButton.outline(
                  label: 'Read & understood',
                  icon: PhosphorIconsRegular.check,
                  onPressed: () => notifier.acknowledge(notice),
                ),
              if (isAdmin && (notice.activeEmployeeCount ?? 0) > 0)
                AppButton.ghost(
                  label:
                      '${notice.acknowledgedCount ?? 0} / ${notice.activeEmployeeCount} have read it',
                  onPressed: () => AcknowledgementsSheet.show(context, notice),
                ),
            ],
          ),
          if (isAdmin) ...[
            const Gap(8),
            Row(
              children: [
                Icon(
                  PhosphorIconsRegular.clock,
                  size: 14,
                  color: c.mutedForeground,
                ),
                const Gap(4),
                Expanded(
                  child: Text(
                    'Expires at: ${expires.mdy()}',
                    style: context.text.muted12,
                  ),
                ),
                IconButton(
                  tooltip: 'Edit notice',
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(PhosphorIconsRegular.pencilSimple, size: 18),
                  onPressed: () =>
                      NoticeFormSheet.show(context, editing: notice),
                ),
                IconButton(
                  tooltip: 'Delete notice',
                  visualDensity: VisualDensity.compact,
                  color: c.destructive,
                  icon: const Icon(PhosphorIconsRegular.trash, size: 18),
                  onPressed: () async {
                    final id = notice.id;
                    if (id == null) {
                      return;
                    }
                    final yes = await showAppConfirm(
                      context,
                      title: 'Confirm Delete?',
                      message: 'Are you sure you want to delete this notice?',
                      confirmLabel: 'Delete',
                      destructive: true,
                    );
                    if (yes) {
                      await notifier.delete(id);
                    }
                  },
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _AcknowledgedChip extends StatelessWidget {
  const _AcknowledgedChip({this.on});

  final DateTime? on;

  @override
  Widget build(BuildContext context) {
    final green = context.colors.success;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: green.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(PhosphorIconsBold.check, size: 14, color: green),
          const Gap(6),
          Text(
            'Read & understood${on == null ? '' : ' · ${on.custom('d MMM')}'}',
            style: context.text.medium12.copyWith(color: green),
          ),
        ],
      ),
    );
  }
}
