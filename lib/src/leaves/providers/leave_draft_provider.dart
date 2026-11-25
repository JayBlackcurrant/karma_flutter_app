import 'package:api/api.dart';
import 'package:flutter/foundation.dart';
import 'package:karma/core/extension/model.dart';
import 'package:karma/src/leaves/utils/long_weekend_planner.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leave_draft_provider.g.dart';

/// What the apply form currently holds. Lives in a provider (not widget
/// state) so the long-weekend planner can fill it in.
@immutable
class LeaveDraft {
  const LeaveDraft({
    this.reason = LeaveReason.sick,
    this.type = LeaveType.fullDay,
    this.from,
    this.to,
    this.description = '',
  });

  final LeaveReason reason;
  final LeaveType type;

  /// Half days use [from] only; full day / WFH use [from]..[to].
  final DateTime? from;
  final DateTime? to;
  final String description;

  bool get hasDates =>
      type.isHalfDay ? from != null : from != null && to != null;

  /// Body for `POST /leave`. Dates go out as epoch ms of local midnight,
  /// exactly like the web (`moment(date).valueOf()`).
  ApplyLeaveRequest toRequest() {
    final start = from!;
    final end = type.isHalfDay ? start : to!;
    return ApplyLeaveRequest(
      reason: reason,
      type: type,
      description: description.trim(),
      from: DateTime(start.year, start.month, start.day).millisecondsSinceEpoch,
      to: DateTime(end.year, end.month, end.day).millisecondsSinceEpoch,
    );
  }

  LeaveDraft copyWith({
    LeaveReason? reason,
    LeaveType? type,
    String? description,
  }) =>
      LeaveDraft(
        reason: reason ?? this.reason,
        type: type ?? this.type,
        from: from,
        to: to,
        description: description ?? this.description,
      );

  LeaveDraft withDates(DateTime? from, [DateTime? to]) => LeaveDraft(
        reason: reason,
        type: type,
        from: from,
        to: to,
        description: description,
      );
}

@riverpod
class LeaveDraftNotifier extends _$LeaveDraftNotifier {
  @override
  LeaveDraft build() => const LeaveDraft();

  void setReason(LeaveReason reason) => state = state.copyWith(reason: reason);

  /// Switching between half day and range clears the dates (as on the web).
  void setType(LeaveType type) =>
      state = state.copyWith(type: type).withDates(null);

  void setDates(DateTime? from, [DateTime? to]) =>
      state = state.withDates(from, to);

  void setDescription(String text) => state = state.copyWith(description: text);

  /// "Plan it": full-day casual leave over the bridge days, with a default
  /// description if none was typed.
  void plan(LongWeekend w) {
    if (w.isFree) {
      return;
    }
    state = LeaveDraft(
      reason: LeaveReason.casual,
      from: w.leaveDays.first,
      to: w.leaveDays.last,
      description: state.description.trim().isNotEmpty
          ? state.description
          : 'Long weekend around ${w.holidayNames.join(' and ')}',
    );
  }

  /// After a successful apply: keep reason/type, clear the rest.
  void clearAfterSubmit() =>
      state = LeaveDraft(reason: state.reason, type: state.type);
}
