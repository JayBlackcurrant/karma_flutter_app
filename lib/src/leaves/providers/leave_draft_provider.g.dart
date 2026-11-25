// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_draft_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LeaveDraftNotifier)
const leaveDraftProvider = LeaveDraftNotifierProvider._();

final class LeaveDraftNotifierProvider
    extends $NotifierProvider<LeaveDraftNotifier, LeaveDraft> {
  const LeaveDraftNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'leaveDraftProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$leaveDraftNotifierHash();

  @$internal
  @override
  LeaveDraftNotifier create() => LeaveDraftNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LeaveDraft value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LeaveDraft>(value),
    );
  }
}

String _$leaveDraftNotifierHash() =>
    r'2186f226be2fb887f0d7b41681522f1bfdda8306';

abstract class _$LeaveDraftNotifier extends $Notifier<LeaveDraft> {
  LeaveDraft build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LeaveDraft, LeaveDraft>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LeaveDraft, LeaveDraft>, LeaveDraft, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
