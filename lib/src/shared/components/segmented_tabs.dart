import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';

/// The web's segmented tab bar (Notices · Events · Kudos, Apply · My Leaves ·
/// Holidays…): muted track, active segment raised on the background colour.
/// [badges] puts a count pill next to a label (null / 0 hides it).
class SegmentedTabs extends StatelessWidget {
  const SegmentedTabs({
    super.key,
    required this.labels,
    required this.index,
    required this.onChanged,
    this.badges,
  });

  final List<String> labels;
  final List<int?>? badges;
  final int index;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: c.muted,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          for (var i = 0; i < labels.length; i++)
            Expanded(
              child: Semantics(
                button: true,
                selected: i == index,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onChanged(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: i == index ? c.background : Colors.transparent,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: i == index
                          ? const [
                              BoxShadow(
                                color: Color(0x14000000),
                                blurRadius: 3,
                                offset: Offset(0, 1),
                              ),
                            ]
                          : null,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          labels[i],
                          style: context.text.medium14.copyWith(
                            color:
                                i == index ? c.foreground : c.mutedForeground,
                          ),
                        ),
                        if ((badges?.elementAtOrNull(i) ?? 0) > 0) ...[
                          const Gap(6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: c.primary,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              '${badges![i]}',
                              style: context.text.medium12.copyWith(
                                color: c.primaryForeground,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
