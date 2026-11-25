import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:karma/src/leaves/ui/components/apply_leave_form.dart';
import 'package:karma/src/leaves/ui/components/leave_balance_tiles.dart';
import 'package:karma/src/leaves/ui/components/leave_instructions.dart';
import 'package:karma/src/leaves/ui/components/long_weekend_planner_card.dart';

/// Apply tab: balances, long-weekend planner, the form, then the rules.
class ApplySection extends StatefulWidget {
  const ApplySection({super.key});

  @override
  State<ApplySection> createState() => _ApplySectionState();
}

class _ApplySectionState extends State<ApplySection> {
  final _formAnchor = GlobalKey();

  /// "Plan it" fills the form, then brings it into view.
  void _scrollToForm() {
    final ctx = _formAnchor.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const LeaveBalanceTiles(),
        const Gap(16),
        LongWeekendPlannerCard(onPlanned: _scrollToForm),
        const Gap(16),
        ApplyLeaveForm(key: _formAnchor),
        const Gap(16),
        const LeaveInstructions(),
      ],
    );
  }
}
