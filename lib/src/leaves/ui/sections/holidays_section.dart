import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karma/core/extension/async_value.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/src/leaves/providers/holidays_provider.dart';
import 'package:karma/src/shared/components/app_badge.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:karma/src/shared/components/app_empty.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Holiday Details: the company calendar. Past holidays are dimmed; the next
/// one is tagged.
class HolidaysSection extends ConsumerWidget {
  const HolidaysSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final next = ref.watch(nextHolidayProvider).value;
    return AppCard(
      icon: PhosphorIconsRegular.calendarStar,
      title: 'List Of Public Holidays',
      description: 'Holidays for the current financial year.',
      child: ref.watch(holidaysProvider).unfold(
            onRetry: () => ref.invalidate(holidaysProvider),
            (list) => list.isEmpty
                ? const AppEmpty(
                    message:
                        'No holidays on the calendar yet. Someone tell HR.',
                  )
                : Column(
                    children: [
                      for (final (i, h) in list.indexed) ...[
                        if (i > 0) Divider(color: context.colors.border),
                        Opacity(
                          opacity: h.date.daysFromToday() < 0 ? 0.5 : 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 92,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        h.date.custom('d MMM'),
                                        style: context.text.semibold14,
                                      ),
                                      Text(
                                        h.date.custom('EEEE'),
                                        style: context.text.muted12,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    h.name ?? '',
                                    style: context.text.regular14,
                                  ),
                                ),
                                if (next != null && h.id == next.id)
                                  const AppBadge(label: 'Next'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
          ),
    );
  }
}
