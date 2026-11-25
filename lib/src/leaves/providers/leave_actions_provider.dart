import 'package:karma/core/extension/future.dart';
import 'package:karma/core/instances/api_client.dart';
import 'package:karma/core/mixins/action_mixin.dart';
import 'package:karma/src/dashboard/providers/absent_employees_provider.dart';
import 'package:karma/src/leaves/providers/leave_draft_provider.dart';
import 'package:karma/src/leaves/providers/leave_summary_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leave_actions_provider.g.dart';

/// Apply / cancel. State is the "busy" flag for the submit button.
///
/// keepAlive: cancel runs from the My Leaves tab, which doesn't watch this
/// provider — an auto-dispose notifier could be torn down mid-request and then
/// fail on `ref.invalidate` once the call returns.
@Riverpod(keepAlive: true)
class LeaveActions extends _$LeaveActions with ActionMixin {
  @override
  bool build() => false;

  /// `POST /leave` with the current draft. Returns true on success.
  Future<bool> apply() async {
    final draft = ref.read(leaveDraftProvider);
    if (!draft.hasDates) {
      return false;
    }
    state = true;
    final ok = await runAction(
      () async {
        await ref
            .read(apiProvider)
            .getLeaveApi()
            .applyForLeave(applyLeaveRequest: draft.toRequest())
            .guardVoid();
        return true;
      },
      success: 'Leave requested. May your approver be kind.',
    );
    state = false;
    if (ok == true) {
      ref.read(leaveDraftProvider.notifier).clearAfterSubmit();
      _refresh();
    }
    return ok == true;
  }

  /// `DELETE /leave/cancel-leave?leaveId=` — pending requests only.
  Future<void> cancel(int leaveId) async {
    final ok = await runAction(
      () async {
        await ref
            .read(apiProvider)
            .getLeaveApi()
            .cancelLeave(leaveId: leaveId)
            .guardVoid();
        return true;
      },
      success: 'Request cancelled. Plans change, karma understands.',
    );
    if (ok == true) {
      _refresh();
    }
  }

  void _refresh() {
    ref
      ..invalidate(leaveSummaryProvider)
      ..invalidate(absentEmployeesProvider);
  }
}
