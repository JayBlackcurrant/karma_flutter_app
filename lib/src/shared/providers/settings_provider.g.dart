// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// `GET /setting/list_settings` — app-wide flags set by admins
/// (`allowPastLeaves` decides whether the leave form accepts past dates).

@ProviderFor(appSettings)
const appSettingsProvider = AppSettingsProvider._();

/// `GET /setting/list_settings` — app-wide flags set by admins
/// (`allowPastLeaves` decides whether the leave form accepts past dates).

final class AppSettingsProvider extends $FunctionalProvider<
        AsyncValue<Settings>, Settings, FutureOr<Settings>>
    with $FutureModifier<Settings>, $FutureProvider<Settings> {
  /// `GET /setting/list_settings` — app-wide flags set by admins
  /// (`allowPastLeaves` decides whether the leave form accepts past dates).
  const AppSettingsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'appSettingsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appSettingsHash();

  @$internal
  @override
  $FutureProviderElement<Settings> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Settings> create(Ref ref) {
    return appSettings(ref);
  }
}

String _$appSettingsHash() => r'a1ca34990047cc70b17013bbded3ac8b5654bdd0';
