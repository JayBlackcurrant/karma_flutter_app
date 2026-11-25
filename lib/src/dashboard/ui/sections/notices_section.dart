import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/async_value.dart';
import 'package:karma/src/dashboard/providers/notices_provider.dart';
import 'package:karma/src/dashboard/ui/components/notice_form_sheet.dart';
import 'package:karma/src/dashboard/ui/components/notice_tile.dart';
import 'package:karma/src/dashboard/ui/sections/absentees_section.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:karma/src/shared/components/app_empty.dart';
import 'package:karma/src/shared/providers/user_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Notices tab: company announcements, then who's out today.
class NoticesSection extends ConsumerWidget {
  const NoticesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notices = ref.watch(noticesProvider);
    final isAdmin = ref.watch(isAdminProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppCard(
          icon: PhosphorIconsRegular.info,
          title: 'Notices',
          description: 'Company-wide announcements.',
          trailing: isAdmin
              ? IconButton(
                  tooltip: 'Add notice',
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(PhosphorIconsRegular.plus, size: 18),
                  onPressed: () => NoticeFormSheet.show(context),
                )
              : null,
          child: notices.unfold(
            onRetry: () => ref.invalidate(noticesProvider),
            (list) => list.isEmpty
                ? const AppEmpty(
                    message: 'No notices. The calm before the memo.',
                  )
                : Column(
                    children: [
                      for (final (i, n) in list.indexed) ...[
                        if (i > 0) const Gap(12),
                        NoticeTile(notice: n, isAdmin: isAdmin),
                      ],
                    ],
                  ),
          ),
        ),
        const Gap(16),
        const AbsenteesSection(),
      ],
    );
  }
}
