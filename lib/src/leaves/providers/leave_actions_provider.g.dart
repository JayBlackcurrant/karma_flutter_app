// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_actions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Apply / cancel. State is the "busy" flag for the submit button.
///
/// keepAlive: cancel runs from the My Leaves tab, which doesn't watch this
/// provider — an auto-dispose notifier could be torn down mid-request and then
/// fail on `ref.invalidate` once the call returns.

@ProviderFor(LeaveActions)
const leaveActionsProvider = LeaveActionsProvider._();

/// Apply / cancel. State is the "busy" flag for the submit button.
///
/// keepAlive: cancel runs from the My Leaves tab, which doesn't watch this
/// provider — an auto-dispose notifier could be torn down mid-request and then
/// fail on `ref.invalidate` once the call returns.
final class LeaveActionsProvider extends $NotifierProvider<LeaveActions, bool> {
  /// Apply / cancel. State is the "busy" flag for the submit button.
  ///
  /// keepAlive: cancel runs from the My Leaves tab, which doesn't watch this
  /// provider — an auto-dispose notifier could be torn down mid-request and then
  /// fail on `ref.invalidate` once the call returns.
  const LeaveActionsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'leaveActionsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$leaveActionsHash();

  @$internal
  @override
  LeaveActions create() => LeaveActions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$leaveActionsHash() => r'50340a4f023261faa2af63eab6d5adb4a52eb11e';

/// Apply / cancel. State is the "busy" flag for the submit button.
///
/// keepAlive: cancel runs from the My Leaves tab, which doesn't watch this
/// provider — an auto-dispose notifier could be torn down mid-request and then
/// fail on `ref.invalidate` once the call returns.

abstract class _$LeaveActions extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
