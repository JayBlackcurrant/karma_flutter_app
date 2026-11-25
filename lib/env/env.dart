/// Per-flavor configuration. Add a field here, then give it a value in every
/// env below — the compiler makes sure no flavor is left without one.
abstract class AppEnv {
  /// REST base URL (always ends with `/`).
  late final String baseUrl;

  /// Web app URL, used for "open in browser" and reset-password links.
  late final String frontendUrl;

  /// Shown on the splash / about screen so testers know which build they run.
  late final String label;
}

class ProductionEnv implements AppEnv {
  @override
  String baseUrl = 'https://api.karma.blackcurrantlabs.com/production/';

  @override
  String frontendUrl = 'https://karma.blackcurrantlabs.com/';

  @override
  String label = 'Production';
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
}
