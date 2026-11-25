import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/app_config.dart';
import 'package:karma/core/extension/async_value.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/src/routes/app_router.gr.dart';
import 'package:karma/src/shared/components/app_loader.dart';
import 'package:karma/src/shared/components/app_logo.dart';
import 'package:karma/src/shared/providers/token_provider.dart';
import 'package:karma/src/splash/providers/startup_provider.dart';

@RoutePage()
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(startupProvider, (_, next) {
      if (!next.hasValue) {
        return;
      }
      final signedIn = ref.read(tokenProvider).isNotEmpty;
      // AuthGuard validates the token on the way in.
      context.router.replaceAll([
        if (signedIn) const GuardedRouteWrapper() else const SignInRoute(),
      ]);
    });

    final startup = ref.watch(startupProvider);
    final env = ref.watch(appConfigProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppLogo(size: 48),
            const Gap(32),
            startup.unfold(
              (_) => const AppLoader.small(),
              loading: const AppLoader.small(),
              onRetry: () => ref.invalidate(startupProvider),
            ),
            if (!env.isProduction) ...[
              const Gap(16),
              Text(env.env.label, style: context.text.muted12),
            ],
          ],
        ),
      ),
    );
  }
}
