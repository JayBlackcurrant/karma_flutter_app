import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/datetime.dart';

/// UI helpers on generated API models. Keep model-specific presentation
/// (labels, colours, derived values) here instead of inside widgets.

extension AuthUserExt on AuthUser {
  bool get isAdmin => role == Role.ADMIN;
  String get roleLabel => isAdmin ? 'Administrator' : 'Employee';
}

extension LeaveStatusExt on LeaveStatus {
  /// The web app shows "Requested" as "Pending Approval".
  String get label => switch (this) {
        LeaveStatus.requested => 'Pending Approval',
        LeaveStatus.approved => 'Approved',
        LeaveStatus.rejected => 'Rejected',
        LeaveStatus.unknownDefaultOpenApi => 'Unknown',
      };

  Color color(BuildContext context) => switch (this) {
        LeaveStatus.requested => context.colors.warning,
        LeaveStatus.approved => context.colors.success,
        LeaveStatus.rejected => context.colors.destructive,
        LeaveStatus.unknownDefaultOpenApi => context.colors.mutedForeground,
      };
}

extension LeaveTypeExt on LeaveType {
  String get label => value;

  bool get isHalfDay =>
      this == LeaveType.firstHalf || this == LeaveType.secondHalf;
  bool get isWfh => this == LeaveType.workFromHome;
}

extension LeaveExt on Leave {
  /// The API sends `isUnpaid` as 0/1, not a boolean.
  bool get unpaid => isUnpaid == 1;
  bool get isPending => status == LeaveStatus.requested;
  bool get isSingleDay => from.isSameDay(to);
}

extension NoticeExt on Notice {
  /// The API may send `expirationDate` as an ISO string or epoch ms.
  DateTime? get expiresOn => switch (expirationDate) {
        final int ms => DateTime.fromMillisecondsSinceEpoch(ms),
        final num ms => DateTime.fromMillisecondsSinceEpoch(ms.toInt()),
        final String s => DateTime.tryParse(s) ??
            switch (int.tryParse(s)) {
              final int ms => DateTime.fromMillisecondsSinceEpoch(ms),
              _ => null,
            },
        _ => null,
      };

  bool get isAcknowledged => acknowledgedByMe ?? false;
}

extension KudosExt on Kudos {
  String get fromLabel => fromName ?? 'A former colleague';
  String get toLabel => toName ?? 'a former colleague';

  /// Admins can remove any kudos; everyone else only the ones they sent.
  bool canRemove(AuthUser? me) =>
      (me?.isAdmin ?? false) ||
      (fromEmployeeId != null && fromEmployeeId == me?.employeeId);
}

extension AbsentEmployeeExt on AbsentEmployee {
  AbsentLeaveRecord? get todaysLeave => leaveRecords?.firstOrNull;
}

extension CycleStatusExt on CycleStatus {
  String get label => value;
}
