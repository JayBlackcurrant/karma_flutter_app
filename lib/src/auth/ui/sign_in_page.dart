import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/form.dart';
import 'package:karma/core/mixins/validation_mixin.dart';
import 'package:karma/src/auth/providers/session_provider.dart';
import 'package:karma/src/auth/ui/components/forgot_password_sheet.dart';
import 'package:karma/src/shared/components/app_button.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:karma/src/shared/components/app_logo.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    context.hideKeyboard();
    if (!_formKey.isValid) {
      return;
    }
    await ref
        .read(sessionProvider.notifier)
        .login(email: _email.text, password: _password.text);
  }

  @override
  Widget build(BuildContext context) {
    final busy = ref.watch(sessionProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                children: [
                  const AppLogo(size: 40),
                  const Gap(32),
                  AppCard(
                    title: 'Welcome back',
                    description: 'Sign in to your Karma account',
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      onChanged: _formKey.validateDirty,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Email', style: context.text.medium14),
                          const Gap(8),
                          TextFormField(
                            controller: _email,
                            validator: validateEmail,
                            keyboardType: TextInputType.emailAddress,
                            autofillHints: const [AutofillHints.email],
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: 'you@example.com',
                            ),
                          ),
                          const Gap(16),
                          Text('Password', style: context.text.medium14),
                          const Gap(8),
                          TextFormField(
                            controller: _password,
                            validator: validatePassword,
                            obscureText: _obscure,
                            autofillHints: const [AutofillHints.password],
                            onFieldSubmitted: (_) => _submit(),
                            decoration: InputDecoration(
                              hintText: '••••••••',
                              suffixIcon: IconButton(
                                tooltip: _obscure
                                    ? 'Show password'
                                    : 'Hide password',
                                onPressed: () =>
                                    setState(() => _obscure = !_obscure),
                                icon: Icon(
                                  _obscure
                                      ? PhosphorIconsRegular.eyeSlash
                                      : PhosphorIconsRegular.eye,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () => ForgotPasswordSheet.show(
                                context,
                                email: _email.text,
                              ),
                              child: const Text('Forgot password?'),
                            ),
                          ),
                          const Gap(8),
                          AppButton(
                            label: 'Login',
                            expanded: true,
                            loading: busy,
                            onPressed: _submit,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
