import 'package:karma/core/extension/string.dart';

/// Form validators. Mix into a page/state class:
///
/// ```dart
/// class _SignInPageState extends ConsumerState<SignInPage>
///     with ValidationMixin { ... validator: validateEmail ... }
/// ```
mixin ValidationMixin {
  final emailRegEx = RegExp(
    r'^(?!.*\.\.@)[a-zA-Z0-9._%+-]+(?<!\.)@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  final phoneRegEx = RegExp(r'^[0-9]{10}$');
  final panRegEx = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$');

  String? requiredField(String? value, {String? label}) {
    if (value.isNullOrEmpty) {
      return '${label ?? 'Field'} is required';
    }
    return null;
  }

  String? Function(Object?) requiredSelection(String label) {
    return (value) => value == null ? 'Please select $label' : null;
  }

  String? validateEmail(String? value) {
    if (value.isNullOrEmpty) {
      return 'Email address is required';
    }
    if (!emailRegEx.hasMatch(value!.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value.isNullOrEmpty) {
      return 'Password is required';
    }
    return null;
  }

  /// For reset-password: at least 8 chars with a letter and a number.
  String? validateNewPassword(String? value) {
    if (value.isNullOrEmpty) {
      return 'Password is required';
    }
    if (value!.length < 8) {
      return 'Use at least 8 characters';
    }
    if (!RegExp('[A-Za-z]').hasMatch(value) || !RegExp('[0-9]').hasMatch(value)) {
      return 'Use letters and numbers';
    }
    return null;
  }

  String? matchPassword(String? value, String password) {
    if (value.isNullOrEmpty) {
      return 'Password is required';
    }
    if (password != value) {
      return "Passwords don't match";
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value.isNullOrEmpty) {
      return 'Phone is required';
    }
    if (!phoneRegEx.hasMatch(value!)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? validatePAN(String? value) {
    if (value.isNullOrEmpty) {
      return 'PAN number is required';
    }
    if (!panRegEx.hasMatch(value!.toUpperCase())) {
      return 'Please enter a valid PAN number';
    }
    return null;
  }

  String? Function(String?) maxLength(int max, {String? label}) {
    return (value) => (value?.length ?? 0) > max
        ? '${label ?? 'Text'} must be $max characters or fewer'
        : null;
  }
}
