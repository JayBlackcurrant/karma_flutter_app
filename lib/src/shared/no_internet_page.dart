import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/src/routes/app_router.gr.dart';
import 'package:karma/src/shared/components/app_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                PhosphorIconsRegular.wifiSlash,
                size: 40,
                color: context.colors.mutedForeground,
              ),
              const Gap(12),
              Text("You're offline", style: context.text.semibold18),
              const Gap(4),
              Text(
                'Check your connection and try again.',
                style: context.text.muted14,
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              AppButton(
                label: 'Try again',
                onPressed: () =>
                    context.router.replaceAll([const GuardedRouteWrapper()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
