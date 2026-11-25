import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karma/core/constants/keys.dart';
import 'package:karma/core/extension/log.dart';
import 'package:karma/src/routes/app_router.dart';
import 'package:karma/src/theme/app_theme.dart';
import 'package:karma/src/theme/providers/theme_provider.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final mode = ref.watch(appThemeModeProvider);
    final theme = AppTheme();

    return MaterialApp.router(
      title: 'Karma',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: router.config(
        navigatorObservers: () => [
          if (kDebugMode) NavigationObserver(),
        ],
      ),
      scrollBehavior: NoGlowBehavior(),
      theme: theme.light,
      darkTheme: theme.dark,
      themeMode: mode,
      builder: (context, child) {
        // Keep layouts stable on devices with very large accessibility fonts.
        final mediaQuery = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: mediaQuery.textScaler.clamp(
              minScaleFactor: 0.9,
              maxScaleFactor: 1.2,
            ),
          ),
          child: child!,
        );
      },
    );
  }
}

class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

class NavigationObserver extends AutoRouteObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    'Route → ${route.settings.name}'.logInfo();
  }
}
