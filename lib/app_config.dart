import 'package:flutter/services.dart';
import 'package:karma/env/env.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config.g.dart';

@Riverpod(keepAlive: true)
AppConfig appConfig(Ref ref) {
  return AppConfig();
}

class AppConfig {
  AppConfig() {
    init();
  }

  late AppEnv env;

  /// `--flavor production` / `--flavor staging` sets [appFlavor].
  bool get isProduction => appFlavor == 'production';

  void init() {
    env = switch (appFlavor) {
      'production' => ProductionEnv(),
      _ => StagingEnv(),
    };
  }
}
