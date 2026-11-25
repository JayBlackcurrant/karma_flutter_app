import 'package:flutter/widgets.dart';

extension ValidationExt on GlobalKey<FormState> {
  /// Re-validates only the fields the user already touched, so errors don't
  /// light up on pristine fields while typing.
  void validateDirty() {
    final fields = currentState?.validateGranularly() ?? {};
    for (final field in fields) {
      if (field.hasInteractedByUser) {
        field.validate();
      }
    }
  }

  bool get isValid => currentState?.validate() ?? false;
}
