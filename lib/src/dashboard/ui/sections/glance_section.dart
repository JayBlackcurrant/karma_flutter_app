import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/constants/app_constants.dart';
import 'package:karma/core/extension/async_value.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/core/extension/num.dart';
import 'package:karma/src/leaves/providers/holidays_provider.dart';
import 'package:karma/src/leaves/providers/leave_summary_provider.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:karma/src/shared/components/app_loader.dart';
import 'package:karma/src/shared/components/ring_progress.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// The three glance tiles: next holiday countdown, paid leaves left,
/// WFH days left.
class GlanceSection extends ConsumerWidget {
  const GlanceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final holiday = ref.watch(nextHolidayProvider);
    final summary = ref.watch(leaveSummaryProvider);
    const tileLoader = SizedBox(height: 44, child: AppLoader.small());

    return Column(
      children: [
        _Tile(
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: context.colors.muted,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(PhosphorIconsRegular.sun, size: 20),
          ),
          body: holiday.unfold(
            loading: tileLoader,
            onRetry: () => ref.invalidate(holidaysProvider),
            (h) => h == null
                ? Text(
                    'No holidays left on the calendar. Hang in there.',
                    style: context.text.muted14,
                  )
                : _Figure(
                    value: _countdown(h.date.daysFromToday()),
                    caption:
                        'to ${h.name ?? 'the next holiday'} · ${h.date.weekdayDayMonth()}',
                  ),
          ),
        ),
        const Gap(12),
        summary.unfold(
          loading: const _Tile(body: tileLoader),
          onRetry: () => ref.invalidate(leaveSummaryProvider),
          (s) {
            final paid = s.paidLeavesRemaining ?? 0;
            final paidTotal = s.totalLeaves ?? kDefaultTotalLeaves;
            final wfh = s.wfhleavesRemaining ?? 0;
            final wfhTotal = s.totalWFHLeaves ?? kDefaultTotalWfh;
            return Row(
              children: [
                Expanded(
                  child: _Tile(
                    leading: RingProgress(value: paid.ratioOf(paidTotal)),
                    body: _Figure(
                      value: paid.compact,
                      total: paidTotal.compact,
                      caption: 'Paid leaves left',
                    ),
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: _Tile(
                    leading: RingProgress(value: wfh.ratioOf(wfhTotal)),
                    body: _Figure(
                      value: wfh.compact,
                      total: wfhTotal.compact,
                      caption: 'WFH days left',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  static String _countdown(int days) => switch (days) {
        0 => 'Today',
        1 => '1 day',
        _ => '$days days',
      };
}

class _Tile extends StatelessWidget {
  const _Tile({required this.body, this.leading});

  final Widget? leading;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          if (leading case final Widget leading) ...[leading, const Gap(12)],
          Expanded(child: body),
        ],
      ),
    );
  }
}

class _Figure extends StatelessWidget {
  const _Figure({required this.value, required this.caption, this.total});

  final String value;
  final String? total;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: value,
            style: context.text.bold24,
            children: [
              if (total != null)
                TextSpan(text: ' / $total', style: context.text.muted14),
            ],
          ),
        ),
        Text(
          caption,
          style: context.text.muted12,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
