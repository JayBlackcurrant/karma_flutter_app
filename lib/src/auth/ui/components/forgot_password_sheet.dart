import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/form.dart';
import 'package:karma/core/mixins/validation_mixin.dart';
import 'package:karma/src/auth/providers/session_provider.dart';
import 'package:karma/src/shared/components/app_button.dart';

class ForgotPasswordSheet extends ConsumerStatefulWidget {
  const ForgotPasswordSheet({super.key, this.email = ''});

  final String email;

  static Future<void> show(BuildContext context, {String email = ''}) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => ForgotPasswordSheet(email: email),
    );
  }

  @override
  ConsumerState<ForgotPasswordSheet> createState() =>
      _ForgotPasswordSheetState();
}

class _ForgotPasswordSheetState extends ConsumerState<ForgotPasswordSheet>
    with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  late final _email = TextEditingController(text: widget.email);
  bool _sending = false;

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    if (!_formKey.isValid) {
      return;
    }
    setState(() => _sending = true);
    final ok =
        await ref.read(sessionProvider.notifier).forgotPassword(_email.text);
    if (!mounted) {
      return;
    }
    setState(() => _sending = false);
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Forgot password', style: context.text.semibold18),
            const Gap(4),
            Text(
              "Enter your email and we'll send you a reset link.",
              style: context.text.muted14,
            ),
            const Gap(16),
            TextFormField(
              controller: _email,
              validator: validateEmail,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (_) => _send(),
              decoration: const InputDecoration(hintText: 'you@example.com'),
            ),
            const Gap(16),
            AppButton(
              label: 'Send reset link',
              expanded: true,
              loading: _sending,
              onPressed: _send,
            ),
          ],
        ),
      ),
    );
  }
}
