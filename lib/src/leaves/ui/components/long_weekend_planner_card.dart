import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/async_value.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/src/leaves/providers/leave_draft_provider.dart';
import 'package:karma/src/leaves/providers/long_weekends_provider.dart';
import 'package:karma/src/leaves/utils/long_weekend_planner.dart';
import 'package:karma/src/shared/components/app_button.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LongWeekendPlannerCard extends ConsumerWidget {
  const LongWeekendPlannerCard({super.key, required this.onPlanned});

  /// Called after "Plan it" fills the form.
  final VoidCallback onPlanned;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppCard(
      icon: PhosphorIconsRegular.sun,
      title: 'Long-weekend planner',
      description:
          'Upcoming holidays that turn into longer breaks with a day or two '
          'of leave.',
      child: ref.watch(longWeekendsProvider).unfold(
            (breaks) => breaks.isEmpty
                ? Text(
                    'No long weekends to plan right now. Every holiday on the '
                    'calendar lands on a weekend or mid-week. Check back when '
                    "HR adds next year's holidays.",
                    style: context.text.muted14,
                  )
                : SizedBox(
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: breaks.length,
                      separatorBuilder: (_, __) => const Gap(10),
                      itemBuilder: (context, i) => _BreakCard(
                        item: breaks[i],
                        onPlan: () {
                          ref.read(leaveDraftProvider.notifier).plan(breaks[i]);
                          onPlanned();
                        },
                      ),
                    ),
                  ),
          ),
    );
  }
}

class _BreakCard extends StatelessWidget {
  const _BreakCard({required this.item, required this.onPlan});

  final LongWeekend item;
  final VoidCallback onPlan;

  @override
  Widget build(BuildContext context) {
    final days = item.leaveDays;
    final leaveLabel = days.map((d) => d.custom('EEE, d MMM')).join(', ');
    return Container(
      width: 220,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.holidayNames.join(' + '),
            style: context.text.semibold14,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${item.from.custom('EEE d MMM')} – ${item.to.custom('EEE d MMM')}',
            style: context.text.muted12,
          ),
          const Gap(8),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: context.text.regular12,
                children: item.isFree
                    ? [
                        TextSpan(
                          text: '${item.totalDays} days off',
                          style: context.text.semibold12,
                        ),
                        const TextSpan(text: ', no leave needed. Free karma.'),
                      ]
                    : [
                        const TextSpan(text: 'Take '),
                        TextSpan(
                          text: '${days.length}',
                          style: context.text.semibold12,
                        ),
                        TextSpan(
                          text:
                              ' ${days.length == 1 ? 'day' : 'days'} ($leaveLabel), get ',
                        ),
                        TextSpan(
                          text: '${item.totalDays} days off',
                          style: context.text.semibold12,
                        ),
                        const TextSpan(text: '.'),
                      ],
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (!item.isFree)
            AppButton.outline(label: 'Plan it', onPressed: onPlan),
        ],
      ),
    );
  }
}
