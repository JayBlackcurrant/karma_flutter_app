import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/datetime.dart';
import 'package:karma/core/extension/form.dart';
import 'package:karma/core/extension/model.dart';
import 'package:karma/core/mixins/validation_mixin.dart';
import 'package:karma/src/dashboard/providers/notices_provider.dart';
import 'package:karma/src/shared/components/app_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Admin: add a notice (emails everyone) or edit one. Limits match the web
/// form: title ≤ 20, description ≤ 1000, expiry from today on.
class NoticeFormSheet extends ConsumerStatefulWidget {
  const NoticeFormSheet({super.key, this.editing});

  final Notice? editing;

  static Future<void> show(BuildContext context, {Notice? editing}) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => NoticeFormSheet(editing: editing),
    );
  }

  @override
  ConsumerState<NoticeFormSheet> createState() => _NoticeFormSheetState();
}

class _NoticeFormSheetState extends ConsumerState<NoticeFormSheet>
    with ValidationMixin {
  static const _titleMax = 20;
  static const _descriptionMax = 1000;

  final _formKey = GlobalKey<FormState>();
  late final _title = TextEditingController(text: widget.editing?.title);
  late final _description =
      TextEditingController(text: widget.editing?.description);
  late DateTime _expiresOn = widget.editing?.expiresOn ?? DateTime.now();
  bool _saving = false;

  bool get _isEdit => widget.editing != null;

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final today = DateTime.now();
    final first = DateTime(today.year, today.month, today.day);
    final picked = await showDatePicker(
      context: context,
      firstDate: first,
      lastDate: DateTime(today.year + 2),
      initialDate: _expiresOn.isBefore(first) ? first : _expiresOn,
    );
    if (picked != null) {
      setState(() => _expiresOn = picked);
    }
  }

  Future<void> _save() async {
    if (!_formKey.isValid) {
      return;
    }
    setState(() => _saving = true);
    final ok = await ref.read(noticesProvider.notifier).save(
          id: widget.editing?.id,
          title: _title.text,
          description: _description.text,
          expiresOn: _expiresOn,
        );
    if (!mounted) {
      return;
    }
    setState(() => _saving = false);
    if (ok) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        0,
        20,
        20 + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _isEdit ? 'Edit notice' : 'Add Notice',
                style: context.text.semibold18,
              ),
              if (!_isEdit) ...[
                const Gap(4),
                Text(
                  'Posting a notice emails everyone.',
                  style: context.text.muted14,
                ),
              ],
              const Gap(16),
              Text('Title', style: context.text.medium14),
              const Gap(8),
              TextFormField(
                controller: _title,
                maxLength: _titleMax,
                textCapitalization: TextCapitalization.sentences,
                validator: (v) =>
                    requiredField(v, label: 'Title') ??
                    maxLength(_titleMax, label: 'Title')(v),
              ),
              const Gap(8),
              Text('Description', style: context.text.medium14),
              const Gap(8),
              TextFormField(
                controller: _description,
                minLines: 4,
                maxLines: 8,
                maxLength: _descriptionMax,
                textCapitalization: TextCapitalization.sentences,
                validator: (v) =>
                    requiredField(v, label: 'Description') ??
                    maxLength(_descriptionMax, label: 'Description')(v),
              ),
              const Gap(8),
              Text('Expiration Date', style: context.text.medium14),
              const Gap(8),
              OutlinedButton.icon(
                onPressed: _pickDate,
                style: OutlinedButton.styleFrom(
                  alignment: Alignment.centerLeft,
                ),
                icon: const Icon(PhosphorIconsRegular.calendarBlank, size: 18),
                label: Text(_expiresOn.mdy()),
              ),
              const Gap(20),
              AppButton(
                label: _isEdit ? 'Save Changes' : 'Add Notice',
                expanded: true,
                loading: _saving,
                onPressed: _save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
