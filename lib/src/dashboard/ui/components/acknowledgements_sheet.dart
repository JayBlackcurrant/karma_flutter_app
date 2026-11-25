import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/src/dashboard/providers/notices_provider.dart';
import 'package:karma/src/shared/components/app_loader.dart';

/// Admin: who has marked a notice "Read & understood", and who hasn't yet.
class AcknowledgementsSheet extends ConsumerStatefulWidget {
  const AcknowledgementsSheet({super.key, required this.notice});

  final Notice notice;

  static Future<void> show(BuildContext context, Notice notice) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => AcknowledgementsSheet(notice: notice),
    );
  }

  @override
  ConsumerState<AcknowledgementsSheet> createState() =>
      _AcknowledgementsSheetState();
}

class _AcknowledgementsSheetState extends ConsumerState<AcknowledgementsSheet> {
  late final Future<NoticeAcknowledgements?> _future = ref
      .read(noticesProvider.notifier)
      .acknowledgements(widget.notice.id ?? 0);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      builder: (context, controller) => FutureBuilder(
        future: _future,
        builder: (context, snap) {
          final data = snap.data;
          return ListView(
            controller: controller,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            children: [
              Text(
                'Who has read "${widget.notice.title ?? ''}"',
                style: context.text.semibold18,
              ),
              const Gap(4),
              Text(
                'Active employees who marked it "Read & understood", and who '
                "hasn't yet.",
                style: context.text.muted14,
              ),
              const Gap(16),
              if (snap.connectionState != ConnectionState.done)
                const AppLoader()
              else if (data == null)
                Text('Could not load the list', style: context.text.muted14)
              else ...[
                _Group(
                  title: 'Read (${data.acknowledged?.length ?? 0})',
                  empty: 'Nobody yet.',
                  people: data.acknowledged ?? const [],
                  showDate: true,
                ),
                const Gap(20),
                _Group(
                  title: 'Not yet (${data.pending?.length ?? 0})',
                  empty: 'Everyone has read it.',
                  people: data.pending ?? const [],
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _Group extends StatelessWidget {
  const _Group({
    required this.title,
    required this.empty,
    required this.people,
    this.showDate = false,
  });

  final String title;
  final String empty;
  final List<NoticeAcknowledgement> people;
  final bool showDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.text.semibold14),
        const Gap(8),
        if (people.isEmpty)
          Text(empty, style: context.text.muted14)
        else
          for (final p in people)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    child: Text(p.name ?? '', style: context.text.regular14),
                  ),
                  if (showDate)
                    Text(
                      p.acknowledgedOn.custom('d MMM'),
                      style: context.text.muted12,
                    ),
                ],
              ),
            ),
      ],
    );
  }
}
