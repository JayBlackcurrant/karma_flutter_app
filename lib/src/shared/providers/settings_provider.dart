import 'package:api/api.dart';
import 'package:karma/core/extension/future.dart';
import 'package:karma/core/instances/api_client.dart';
import 'package:karma/core/utils/cache_for.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

/// `GET /setting/list_settings` — app-wide flags set by admins
/// (`allowPastLeaves` decides whether the leave form accepts past dates).
@riverpod
Future<Settings> appSettings(Ref ref) async {
  cacheFor(ref, const Duration(minutes: 30));
  return ref.read(apiProvider).getSettingApi().getSettings().guard<Settings>();
}
