import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/core/extension/model.dart';
import 'package:karma/core/extension/string.dart';
import 'package:karma/core/mixins/refreshable_mixin.dart';
import 'package:karma/src/dashboard/providers/absent_employees_provider.dart';
import 'package:karma/src/dashboard/providers/employee_events_provider.dart';
import 'package:karma/src/dashboard/providers/kudos_provider.dart';
import 'package:karma/src/dashboard/providers/notices_provider.dart';
import 'package:karma/src/dashboard/ui/sections/events_section.dart';
import 'package:karma/src/dashboard/ui/sections/glance_section.dart';
import 'package:karma/src/dashboard/ui/sections/kudos_section.dart';
import 'package:karma/src/dashboard/ui/sections/notices_section.dart';
import 'package:karma/src/leaves/providers/holidays_provider.dart';
import 'package:karma/src/leaves/providers/leave_summary_provider.dart';
import 'package:karma/src/shared/components/page_header.dart';
import 'package:karma/src/shared/components/segmented_tabs.dart';
import 'package:karma/src/shared/providers/user_provider.dart';

/// Dashboard: greeting, glance tiles, then Notices / Events / Kudos.
@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage>
    with RefreshableMixin {
  int _tab = 0;

  /// Pull-to-refresh reloads the glance tiles and only the visible tab.
  @override
  List<Refreshable<Future<Object?>>> get refreshables => [
        leaveSummaryProvider.future,
        holidaysProvider.future,
        ...switch (_tab) {
          1 => [employeeEventsProvider.future],
          2 => [kudosWallProvider.future, colleaguesProvider.future],
          _ => [noticesProvider.future, absentEmployeesProvider.future],
        },
      ];

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    // Badge on the Notices tab = notices you haven't acknowledged yet.
    final unread = ref
        .watch(noticesProvider)
        .value
        ?.where((n) => !n.isAcknowledged)
        .length;

    return RefreshIndicator(
      onRefresh: refresh,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PageHeader(
            title: '${DateTime.now().greeting}, ${user?.name.firstName ?? ''}',
            subtitle: "Celebrate someone else's win today.",
            italic: true,
          ),
          const Gap(20),
          const GlanceSection(),
          const Gap(20),
          SegmentedTabs(
            labels: const ['Notices', 'Events', 'Kudos'],
            badges: [unread, null, null],
            index: _tab,
            onChanged: (i) => setState(() => _tab = i),
          ),
          const Gap(16),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: switch (_tab) {
              1 => const EventsSection(key: ValueKey('events')),
              2 => const KudosSection(key: ValueKey('kudos')),
              _ => const NoticesSection(key: ValueKey('notices')),
            },
          ),
        ],
      ),
    );
  }
}
