import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/constants/app_constants.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/form.dart';
import 'package:karma/core/extension/string.dart';
import 'package:karma/core/mixins/validation_mixin.dart';
import 'package:karma/src/dashboard/providers/kudos_provider.dart';
import 'package:karma/src/shared/components/app_button.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:karma/src/shared/components/app_snack_bar.dart';
import 'package:karma/src/shared/providers/user_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GiveKudosCard extends ConsumerStatefulWidget {
  const GiveKudosCard({super.key});

  @override
  ConsumerState<GiveKudosCard> createState() => _GiveKudosCardState();
}

class _GiveKudosCardState extends ConsumerState<GiveKudosCard>
    with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final _message = TextEditingController();
  int? _toId;
  bool _sending = false;

  /// Bumped after a successful send so both fields are rebuilt empty and
  /// without stale validation errors. (`FormState.reset()` can't do this: it
  /// restores each field to the value it was *built* with — the selected
  /// colleague and the typed message.)
  int _generation = 0;

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    context.hideKeyboard();
    if (!_formKey.isValid || _toId == null) {
      'Pick a colleague and say a few words.'
          .toToast(type: SnackBarType.warning);
      return;
    }
    setState(() => _sending = true);
    final ok = await ref
        .read(kudosWallProvider.notifier)
        .give(toEmployeeId: _toId!, message: _message.text);
    if (!mounted) {
      return;
    }
    setState(() {
      _sending = false;
      if (ok) {
        _toId = null;
        _message.clear();
        _generation++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final me = ref.watch(userProvider)?.employeeId;
    final colleagues = ref.watch(colleaguesProvider).value ?? const [];
    final options =
        colleagues.where((c) => c.id != null && c.id != me).toList();

    return AppCard(
      icon: PhosphorIconsRegular.handHeart,
      title: 'Give Karma',
      description:
          'Thank a colleague in public. What you give is what you get.',
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('To', style: context.text.medium14),
            const Gap(8),
            DropdownButtonFormField<int>(
              key: ValueKey('to-$_generation'),
              initialValue: _toId,
              isExpanded: true,
              hint: Text('Pick a colleague', style: context.text.muted14),
              validator: requiredSelection('a colleague'),
              items: [
                for (final c in options)
                  DropdownMenuItem(value: c.id, child: Text(c.name ?? '')),
              ],
              onChanged: (v) => setState(() => _toId = v),
            ),
            const Gap(16),
            Text('What for?', style: context.text.medium14),
            const Gap(8),
            TextFormField(
              key: ValueKey('message-$_generation'),
              controller: _message,
              minLines: 3,
              maxLines: 5,
              maxLength: kKudosMaxLength,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                hintText: 'Thanks for staying late to fix the release...',
              ),
              validator: (v) => requiredField(v, label: 'Message'),
            ),
            const Gap(8),
            Align(
              alignment: Alignment.centerLeft,
              child: AppButton(
                label: 'Send kudos',
                icon: PhosphorIconsRegular.paperPlaneTilt,
                loading: _sending,
                onPressed: _send,
              ),
            ),
            const Gap(12),
            Text(
              'Up to $kKudosPerDay a day. Everyone can see the wall. Kudos are '
              'not part of any bonus calculation.',
              style: context.text.muted12,
            ),
          ],
        ),
      ),
    );
  }
}
