import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// The web's "Leave Instructions" panel, collapsed by default.
class LeaveInstructions extends StatefulWidget {
  const LeaveInstructions({super.key});

  @override
  State<LeaveInstructions> createState() => _LeaveInstructionsState();
}

class _LeaveInstructionsState extends State<LeaveInstructions> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final body = context.text.regular14;
    return AppCard(
      onTap: () => setState(() => _open = !_open),
      icon: PhosphorIconsRegular.info,
      title: 'Leave Instructions',
      trailing: Icon(
        _open ? PhosphorIconsRegular.caretUp : PhosphorIconsRegular.caretDown,
        size: 16,
      ),
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 200),
        crossFadeState:
            _open ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        firstChild: Text(
          'How leave days are counted.',
          style: context.text.muted14,
        ),
        secondChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('If the leaves are overlapping with:', style: body),
            const Gap(4),
            for (final item in const [
              'Weekends',
              'Public Holidays',
              'Month end',
            ])
              Text('  •  $item', style: body),
            const Gap(6),
            Text(
              'Then break the leaves into multiple parts such that every '
              'leave is taken into consideration during working days only.',
              style: body,
            ),
            const Gap(10),
            Text(
              'If you have less than 1 leave remaining then any full day '
              'leave will be counted as unpaid leave.',
              style: context.text.muted14,
            ),
            const Gap(4),
            Text(
              'If you have less than 0.5 leave remaining then any half day '
              'leave will be counted as unpaid leave.',
              style: context.text.muted14,
            ),
          ],
        ),
      ),
    );
  }
}
