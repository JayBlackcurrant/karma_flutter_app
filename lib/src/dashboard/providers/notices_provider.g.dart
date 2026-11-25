// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notices_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// `GET /notice` plus the notice actions: acknowledge (everyone) and
/// add / edit / delete (admin).

@ProviderFor(Notices)
const noticesProvider = NoticesProvider._();

/// `GET /notice` plus the notice actions: acknowledge (everyone) and
/// add / edit / delete (admin).
final class NoticesProvider
    extends $AsyncNotifierProvider<Notices, List<Notice>> {
  /// `GET /notice` plus the notice actions: acknowledge (everyone) and
  /// add / edit / delete (admin).
  const NoticesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'noticesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$noticesHash();

  @$internal
  @override
  Notices create() => Notices();
}

String _$noticesHash() => r'0ab15d284445c7f43a98b25ddcadb3c728bad0e1';

/// `GET /notice` plus the notice actions: acknowledge (everyone) and
/// add / edit / delete (admin).

abstract class _$Notices extends $AsyncNotifier<List<Notice>> {
  FutureOr<List<Notice>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Notice>>, List<Notice>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<Notice>>, List<Notice>>,
        AsyncValue<List<Notice>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
