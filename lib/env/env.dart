/// Per-flavor configuration. Add a field here, then give it a value in every
/// env below — the compiler makes sure no flavor is left without one.
abstract class AppEnv {
  /// REST base URL (always ends with `/`).
  late final String baseUrl;

  /// Web app URL, used for "open in browser" and reset-password links.
  late final String frontendUrl;

  /// Shown on the splash / about screen so testers know which build they run.
  late final String label;

  /// DEV: pretend the signed-in user is an admin (RoleOverrideInterceptor).
  /// Only honoured in debug builds; keep it false for production.
  late final bool forceAdminRole;
}

class ProductionEnv implements AppEnv {
  @override
  String baseUrl = 'https://api.karma.blackcurrantlabs.com/production/';

  @override
  String frontendUrl = 'https://karma.blackcurrantlabs.com/';

  @override
  String label = 'Production';

  @override
  bool forceAdminRole = true;
}

class StagingEnv implements AppEnv {
  // No staging API stage was observed while reverse engineering Karma, so
  // staging talks to production until the backend exposes one. Point this at
  // the staging stage (e.g. `/staging/`) as soon as it exists.
  @override
  String baseUrl = 'https://api.karma.blackcurrantlabs.com/production/';

  @override
  String frontendUrl = 'https://karma.blackcurrantlabs.com/';

  @override
  String label = 'Staging';

  /// On while the admin screens are being built. Turn off to test as the
  /// account's real role, or with `--dart-define=FORCE_ADMIN=false`.
  @override
  bool forceAdminRole = const bool.fromEnvironment(
    'FORCE_ADMIN',
    defaultValue: true,
  );
}
