import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karma/core/extension/async_value.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/core/extension/model.dart';
import 'package:karma/src/dashboard/providers/absent_employees_provider.dart';
import 'package:karma/src/shared/components/app_badge.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:karma/src/shared/components/app_empty.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AbsenteesSection extends ConsumerWidget {
  const AbsenteesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final absent = ref.watch(absentEmployeesProvider);
    return AppCard(
      icon: PhosphorIconsRegular.userMinus,
      title: 'Absentee Employees',
      description:
          'Team members on leave today, including requests still awaiting '
          'approval.',
      child: absent.unfold(
        onRetry: () => ref.invalidate(absentEmployeesProvider),
        (list) {
          if (list.isEmpty) {
            return const AppEmpty(
              message: "Nobody's out today. Full house, full karma.",
              icon: PhosphorIconsRegular.usersThree,
            );
          }
          return Column(
            children: [
              for (final (i, e) in list.indexed) ...[
                if (i > 0) Divider(color: context.colors.border),
                _AbsentRow(
                  name: e.name ?? '',
                  from: e.todaysLeave?.from,
                  to: e.todaysLeave?.to,
                  type: e.todaysLeave?.type?.label,
                  status: e.todaysLeave?.status,
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _AbsentRow extends StatelessWidget {
  const _AbsentRow({
    required this.name,
    this.from,
    this.to,
    this.type,
    this.status,
  });

  final String name;
  final DateTime? from;
  final DateTime? to;
  final String? type;
  final LeaveStatus? status;

  @override
  Widget build(BuildContext context) {
    final dates = to == null || from.isSameDay(to)
        ? from.mdy()
        : '${from.mdy()} – ${to.mdy()}';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: context.text.medium14),
                Text(dates, style: context.text.muted12),
              ],
            ),
          ),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            alignment: WrapAlignment.end,
            children: [
              if (type != null) AppBadge(label: type!),
              if (status case final LeaveStatus s)
                AppBadge(label: s.label, color: s.color(context)),
            ],
          ),
        ],
      ),
    );
  }
}
