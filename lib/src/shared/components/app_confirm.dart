import 'package:flutter/material.dart';
import 'package:karma/src/shared/components/app_button.dart';

/// Confirmation dialog (the web's `notify.confirm`). Resolves to true only
/// when the user taps the confirm button.
Future<bool> showAppConfirm(
  BuildContext context, {
  required String title,
  required String message,
  String confirmLabel = 'Confirm',
  bool destructive = false,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      actions: [
        AppButton.outline(
          label: 'Cancel',
          onPressed: () => Navigator.of(context).pop(false),
        ),
        if (destructive)
          AppButton.destructive(
            label: confirmLabel,
            onPressed: () => Navigator.of(context).pop(true),
          )
        else
          AppButton(
            label: confirmLabel,
            onPressed: () => Navigator.of(context).pop(true),
          ),
      ],
    ),
  );
  return result ?? false;
}
