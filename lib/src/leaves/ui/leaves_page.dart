import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/model.dart';
import 'package:karma/core/mixins/refreshable_mixin.dart';
import 'package:karma/src/leaves/providers/holidays_provider.dart';
import 'package:karma/src/leaves/providers/leave_summary_provider.dart';
import 'package:karma/src/leaves/ui/sections/apply_section.dart';
import 'package:karma/src/leaves/ui/sections/holidays_section.dart';
import 'package:karma/src/leaves/ui/sections/my_leaves_section.dart';
import 'package:karma/src/shared/components/page_header.dart';
import 'package:karma/src/shared/components/segmented_tabs.dart';
import 'package:karma/src/shared/providers/settings_provider.dart';

/// Leaves: Apply For Leave · My Leave Details · Holiday Details.
@RoutePage()
class LeavesPage extends ConsumerStatefulWidget {
  const LeavesPage({super.key});

  @override
  ConsumerState<LeavesPage> createState() => _LeavesPageState();
}

class _LeavesPageState extends ConsumerState<LeavesPage> with RefreshableMixin {
  int _tab = 0;
  final _scroll = ScrollController();

  @override
  List<Refreshable<Future<Object?>>> get refreshables => [
        leaveSummaryProvider.future,
        holidaysProvider.future,
        if (_tab == 0) appSettingsProvider.future,
      ];

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pending = ref
        .watch(leaveSummaryProvider)
        .value
        ?.leaves
        ?.where((l) => l.isPending)
        .length;

    return RefreshIndicator(
      onRefresh: refresh,
      child: ListView(
        controller: _scroll,
        padding: const EdgeInsets.all(16),
        children: [
          const PageHeader(
            title: 'Leaves',
            subtitle:
                'Apply for leave, track your requests and manage holidays.',
          ),
          const Gap(20),
          SegmentedTabs(
            labels: const ['Apply', 'My Leaves', 'Holidays'],
            badges: [null, pending, null],
            index: _tab,
            onChanged: (i) => setState(() => _tab = i),
          ),
          const Gap(16),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: switch (_tab) {
              1 => const MyLeavesSection(key: ValueKey('mine')),
              2 => const HolidaysSection(key: ValueKey('holidays')),
              _ => const ApplySection(key: ValueKey('apply')),
            },
          ),
        ],
      ),
    );
  }
}
