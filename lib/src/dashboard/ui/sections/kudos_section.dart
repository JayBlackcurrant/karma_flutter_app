import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/async_value.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/core/extension/model.dart';
import 'package:karma/src/dashboard/providers/kudos_provider.dart';
import 'package:karma/src/dashboard/ui/components/give_kudos_card.dart';
import 'package:karma/src/shared/components/accent_tile.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:karma/src/shared/components/app_confirm.dart';
import 'package:karma/src/shared/components/app_empty.dart';
import 'package:karma/src/shared/providers/user_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Kudos tab: "Give Karma" form above the public wall.
class KudosSection extends ConsumerWidget {
  const KudosSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wall = ref.watch(kudosWallProvider);
    final me = ref.watch(userProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const GiveKudosCard(),
        const Gap(16),
        AppCard(
          icon: PhosphorIconsRegular.heart,
          title: 'Kudos wall',
          description: 'The latest thank-yous across the team.',
          child: wall.unfold(
            onRetry: () => ref.invalidate(kudosWallProvider),
            (list) => list.isEmpty
                ? const AppEmpty(
                    message:
                        'The wall is empty. Be the first to give some karma.',
                  )
                : Column(
                    children: [
                      for (final (i, k) in list.indexed) ...[
                        if (i > 0) const Gap(10),
                        _KudosTile(
                          kudos: k,
                          canRemove: k.canRemove(me),
                          me: me,
                        ),
                      ],
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}

class _KudosTile extends ConsumerWidget {
  const _KudosTile({required this.kudos, required this.canRemove, this.me});

  final Kudos kudos;
  final bool canRemove;
  final AuthUser? me;

  Future<void> _remove(BuildContext context, WidgetRef ref) async {
    final mine =
        kudos.fromEmployeeId != null && kudos.fromEmployeeId == me?.employeeId;
    final yes = await showAppConfirm(
      context,
      title: 'Remove kudos',
      message: mine
          ? 'Take this kudos back?'
          : 'Remove this kudos from ${kudos.fromLabel} to ${kudos.toLabel}?',
      confirmLabel: 'Remove',
      destructive: true,
    );
    if (yes) {
      await ref.read(kudosWallProvider.notifier).remove(kudos);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    return AccentTile(
      padding: const EdgeInsets.fromLTRB(12, 10, 4, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    style: context.text.semibold14,
                    children: [
                      TextSpan(text: kudos.fromLabel),
                      TextSpan(text: '  →  ', style: context.text.muted14),
                      TextSpan(text: kudos.toLabel),
                    ],
                  ),
                ),
                const Gap(4),
                Text(kudos.message ?? '', style: context.text.regular14),
                const Gap(4),
                Text(
                  kudos.createdAt.custom('d MMM, h:mm a'),
                  style: context.text.muted12,
                ),
              ],
            ),
          ),
          if (canRemove)
            IconButton(
              tooltip: 'Remove kudos',
              visualDensity: VisualDensity.compact,
              color: c.mutedForeground,
              icon: const Icon(PhosphorIconsRegular.x, size: 16),
              onPressed: () => _remove(context, ref),
            ),
        ],
      ),
    );
  }
}
