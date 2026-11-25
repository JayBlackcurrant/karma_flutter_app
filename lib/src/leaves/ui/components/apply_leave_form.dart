import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/core/extension/enum.dart';
import 'package:karma/core/extension/model.dart';
import 'package:karma/core/extension/string.dart';
import 'package:karma/src/leaves/providers/leave_actions_provider.dart';
import 'package:karma/src/leaves/providers/leave_draft_provider.dart';
import 'package:karma/src/leaves/providers/leave_summary_provider.dart';
import 'package:karma/src/leaves/providers/long_weekends_provider.dart';
import 'package:karma/src/shared/components/app_button.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:karma/src/shared/components/app_confirm.dart';
import 'package:karma/src/shared/components/app_snack_bar.dart';
import 'package:karma/src/shared/providers/settings_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// "Apply For Leave": reason, type, date / range, description.
/// Weekends and holidays can't be picked; past dates only when the admin
/// setting `allowPastLeaves` is on.
class ApplyLeaveForm extends ConsumerStatefulWidget {
  const ApplyLeaveForm({super.key});

  @override
  ConsumerState<ApplyLeaveForm> createState() => _ApplyLeaveFormState();
}

class _ApplyLeaveFormState extends ConsumerState<ApplyLeaveForm> {
  final _description = TextEditingController();
  bool _showErrors = false;

  /// Order matches the web form.
  static const _types = [
    LeaveType.fullDay,
    LeaveType.firstHalf,
    LeaveType.secondHalf,
    LeaveType.workFromHome,
  ];

  @override
  void initState() {
    super.initState();
    _description.text = ref.read(leaveDraftProvider).description;
  }

  @override
  void dispose() {
    _description.dispose();
    super.dispose();
  }

  LeaveDraftNotifier get _draft => ref.read(leaveDraftProvider.notifier);

  bool _selectable(DateTime day, Set<DateTime> holidays) =>
      !day.isWeekend &&
      !holidays.contains(DateTime(day.year, day.month, day.day));

  ({DateTime first, DateTime last}) _bounds() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final allowPast =
        ref.read(appSettingsProvider).value?.allowPastLeaves ?? false;
    return (
      first:
          allowPast ? DateTime(today.year - 1, today.month, today.day) : today,
      last: DateTime(today.year + 1, today.month, today.day),
    );
  }

  Future<void> _pickDates() async {
    final holidays = ref.read(holidayDaysProvider).value ?? const {};
    final draft = ref.read(leaveDraftProvider);
    final (:first, :last) = _bounds();

    if (draft.type.isHalfDay) {
      // showDatePicker asserts the initial date is selectable.
      var initial = draft.from ?? first;
      while (!_selectable(initial, holidays) && initial.isBefore(last)) {
        initial = initial.add(const Duration(days: 1));
      }
      final picked = await showDatePicker(
        context: context,
        firstDate: first,
        lastDate: last,
        initialDate: initial,
        selectableDayPredicate: (d) => _selectable(d, holidays),
      );
      if (picked != null) {
        _draft.setDates(picked);
      }
      return;
    }

    final picked = await showDateRangePicker(
      context: context,
      firstDate: first,
      lastDate: last,
      initialDateRange: draft.from != null && draft.to != null
          ? DateTimeRange(start: draft.from!, end: draft.to!)
          : null,
      helpText: 'Select date range',
      selectableDayPredicate: (d, _, __) => _selectable(d, holidays),
    );
    if (picked != null) {
      _draft.setDates(picked.start, picked.end);
    }
  }

  Future<void> _submit() async {
    context.hideKeyboard();
    final draft = ref.read(leaveDraftProvider);
    if (!draft.hasDates || draft.description.trim().isEmpty) {
      setState(() => _showErrors = true);
      'Enter Valid Details'.toToast(type: SnackBarType.warning);
      return;
    }
    final when = draft.type.isHalfDay || draft.from.isSameDay(draft.to)
        ? draft.from.mdy()
        : '${draft.from.mdy()} – ${draft.to.mdy()}';
    final yes = await showAppConfirm(
      context,
      title: 'Caution',
      message: 'You are about to apply for a leave, please confirm the '
          'details before proceeding.\n\n'
          '${draft.type.label} · ${draft.reason.label}\n$when',
      confirmLabel: 'Apply',
    );
    if (!yes) {
      return;
    }
    final ok = await ref.read(leaveActionsProvider.notifier).apply();
    if (ok && mounted) {
      setState(() => _showErrors = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Keep the text field in step when the planner fills / submit clears it.
    ref.listen(leaveDraftProvider.select((d) => d.description), (_, next) {
      if (_description.text != next) {
        _description.text = next;
      }
    });

    final draft = ref.watch(leaveDraftProvider);
    final busy = ref.watch(leaveActionsProvider);
    final paidLeft = ref.watch(leaveSummaryProvider).value?.paidLeavesRemaining;
    // Holidays and settings feed the pickers; warm them up.
    ref
      ..watch(holidayDaysProvider)
      ..watch(appSettingsProvider);

    final unpaidWarning = switch (paidLeft) {
      final left? when draft.type == LeaveType.fullDay && left < 1 =>
        'You have less than 1 leave remaining, so this full day will be '
            'counted as unpaid leave.',
      final left? when draft.type.isHalfDay && left < 0.5 =>
        'You have less than 0.5 leave remaining, so this half day will be '
            'counted as unpaid leave.',
      _ => null,
    };

    final dateLabel = switch (draft) {
      LeaveDraft(from: null) =>
        draft.type.isHalfDay ? 'Pick a date' : 'Select date range',
      LeaveDraft(:final from, :final to)
          when draft.type.isHalfDay || to == null =>
        from.mdy(),
      LeaveDraft(:final from, :final to) => '${from.mdy()} – ${to.mdy()}',
    };

    return AppCard(
      icon: PhosphorIconsRegular.paperPlaneTilt,
      title: 'Apply For Leave',
      description: 'Submit a new leave request.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: _Labeled(
                  label: 'Reason',
                  child: DropdownButtonFormField<LeaveReason>(
                    key: ValueKey('reason-${draft.reason}'),
                    initialValue: draft.reason,
                    isExpanded: true,
                    items: [
                      for (final r in LeaveReason.values.filtered())
                        DropdownMenuItem(value: r, child: Text(r.label)),
                    ],
                    onChanged: (r) => r == null ? null : _draft.setReason(r),
                  ),
                ),
              ),
              const Gap(12),
              Expanded(
                child: _Labeled(
                  label: 'Type',
                  child: DropdownButtonFormField<LeaveType>(
                    key: ValueKey('type-${draft.type}'),
                    initialValue: draft.type,
                    isExpanded: true,
                    items: [
                      for (final t in _types)
                        DropdownMenuItem(
                          value: t,
                          child: Text(t.label, overflow: TextOverflow.ellipsis),
                        ),
                    ],
                    onChanged: (t) => t == null ? null : _draft.setType(t),
                  ),
                ),
              ),
            ],
          ),
          const Gap(16),
          _Labeled(
            label: draft.type.isHalfDay ? 'Date' : 'Date (Start and End Date)',
            error: _showErrors && !draft.hasDates
                ? (draft.type.isHalfDay
                    ? 'Please pick a date'
                    : 'Please pick a start and end date')
                : null,
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickDates,
                    style: OutlinedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      side: BorderSide(
                        color: _showErrors && !draft.hasDates
                            ? context.colors.destructive
                            : context.colors.input,
                      ),
                    ),
                    icon: const Icon(
                      PhosphorIconsRegular.calendarBlank,
                      size: 18,
                    ),
                    label: Text(
                      dateLabel,
                      style: draft.from == null
                          ? context.text.muted14
                          : context.text.regular14,
                    ),
                  ),
                ),
                if (draft.from != null)
                  IconButton(
                    tooltip: 'Reset Date',
                    icon: const Icon(PhosphorIconsRegular.x, size: 18),
                    onPressed: () => _draft.setDates(null),
                  ),
              ],
            ),
          ),
          const Gap(16),
          _Labeled(
            label: 'Description',
            child: TextField(
              controller: _description,
              minLines: 3,
              maxLines: 6,
              textCapitalization: TextCapitalization.sentences,
              onChanged: _draft.setDescription,
              decoration: InputDecoration(
                hintText: 'A line for your approver',
                errorText: _showErrors && draft.description.trim().isEmpty
                    ? 'Description is required'
                    : null,
              ),
            ),
          ),
          if (unpaidWarning != null) ...[
            const Gap(12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  PhosphorIconsRegular.warning,
                  size: 16,
                  color: context.colors.warning,
                ),
                const Gap(6),
                Expanded(
                  child: Text(
                    unpaidWarning,
                    style: context.text.regular12
                        .copyWith(color: context.colors.warning),
                  ),
                ),
              ],
            ),
          ],
          const Gap(16),
          AppButton(
            label: 'Apply',
            expanded: true,
            loading: busy,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}

class _Labeled extends StatelessWidget {
  const _Labeled({required this.label, required this.child, this.error});

  final String label;
  final Widget child;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: context.text.medium14),
        const Gap(8),
        child,
        if (error != null) ...[
          const Gap(6),
          Text(
            error!,
            style: context.text.regular12
                .copyWith(color: context.colors.destructive),
          ),
        ],
      ],
    );
  }
}
