import 'package:karma/core/instances/shar_pref.dart';
import 'package:karma/src/more/providers/package_info_provider.dart';
import 'package:karma/src/shared/providers/internet_connection_provider.dart';
import 'package:karma/src/shared/providers/token_provider.dart';
import 'package:karma/src/theme/providers/theme_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'startup_provider.g.dart';

/// Everything that must be ready before the first authenticated request.
/// Add new boot-time work here (push notifications, analytics, remote config…).
@Riverpod(keepAlive: true)
Future<void> startup(Ref ref) async {
  ref.onDispose(() {
    ref.invalidate(sharedPrefProvider);
  });

  await ref.watch(sharedPrefProvider.future);

  // Restore the stored session before anything can call the API.
  ref.read(tokenProvider.notifier).fetch();
  ref.read(appThemeModeProvider.notifier).fetch();

  await Future.wait([
    // App-Version header needs it before the API client is built.
    ref.read(packageInfoProvider.future),
  ]);

  ref.read(internetConnectionProvider);
}
