import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/async_value.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/src/dashboard/providers/employee_events_provider.dart';
import 'package:karma/src/shared/components/accent_tile.dart';
import 'package:karma/src/shared/components/app_badge.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:karma/src/shared/components/app_empty.dart';
import 'package:karma/src/shared/providers/user_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Events tab: today's celebrations, upcoming birthdays / anniversar ies,
/// and (admin) probations ending soon.
class EventsSection extends ConsumerWidget {
  const EventsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(employeeEventsProvider);
    final isAdmin = ref.watch(isAdminProvider);

    return events.unfold(
      onRetry: () => ref.invalidate(employeeEventsProvider),
      (e) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppCard(
            icon: PhosphorIconsRegular.gift,
            title: "Today's Events",
            description: 'Celebrations happening today.',
            child: e.today.isEmpty
                ? const AppEmpty(
                    message: 'No cake today. Back to work, but kindly.',
                  )
                : Column(
                    children: [
                      for (final (i, ev) in e.today.indexed) ...[
                        if (i > 0) const Gap(10),
                        _TodayTile(event: ev),
                      ],
                    ],
                  ),
          ),
          const Gap(16),
          AppCard(
            icon: PhosphorIconsRegular.calendarBlank,
            title: 'Upcoming Events',
            description: 'Birthdays and work anniversaries coming up.',
            child: e.upcoming.isEmpty
                ? const AppEmpty(
                    message:
                        'No birthdays or anniversaries coming up. Suspiciously quiet.',
                  )
                : _EventList(events: e.upcoming, yearless: true),
          ),
          if (isAdmin) ...[
            const Gap(16),
            AppCard(
              icon: PhosphorIconsRegular.clock,
              title: 'Admin Events',
              description: 'Upcoming probation endings and admin reminders.',
              child: e.admin.isEmpty
                  ? const AppEmpty(
                      message:
                          'No probations ending soon. Nothing for you to chase.',
                    )
                  : _EventList(events: e.admin),
            ),
          ],
        ],
      ),
    );
  }
}

class _TodayTile extends StatelessWidget {
  const _TodayTile({required this.event});

  final DashboardEvent event;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final isBirthday = event.kind == EventKind.birthday;
    return AccentTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(PhosphorIconsFill.gift, size: 16, color: c.brand),
              const Gap(8),
              Expanded(child: Text(event.name, style: context.text.semibold14)),
            ],
          ),
          const Gap(4),
          Text(
            isBirthday ? 'Happy birthday! 🎂' : 'Happy work anniversary!',
            style: context.text.muted14,
          ),
        ],
      ),
    );
  }
}

class _EventList extends StatelessWidget {
  const _EventList({required this.events, this.yearless = false});

  final List<DashboardEvent> events;

  /// Birthdays / anniversaries: show "dd, MMMM" (no birth year), like the web.
  final bool yearless;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final (i, ev) in events.indexed) ...[
          if (i > 0) Divider(color: context.colors.border),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 96,
                  child: Text(
                    yearless ? ev.date.custom('dd, MMMM') : ev.date.mdy(),
                    style: context.text.muted12,
                  ),
                ),
                Expanded(child: Text(ev.name, style: context.text.medium14)),
                AppBadge(label: ev.kind.label),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
