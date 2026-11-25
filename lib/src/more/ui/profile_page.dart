import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karma/app_config.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/model.dart';
import 'package:karma/core/extension/string.dart';
import 'package:karma/src/auth/providers/session_provider.dart';
import 'package:karma/src/more/providers/package_info_provider.dart';
import 'package:karma/src/shared/components/app_button.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:karma/src/shared/providers/user_provider.dart';
import 'package:karma/src/theme/providers/theme_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final mode = ref.watch(appThemeModeProvider);
    final version = ref.watch(packageInfoProvider).value ?? '';
    final env = ref.watch(appConfigProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AppCard(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: context.colors.muted,
                  child: Text(
                    user?.name.initials ?? '?',
                    style: context.text.semibold16,
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user?.name ?? '', style: context.text.semibold16),
                      Text(user?.email ?? '', style: context.text.muted14),
                      Text(user?.roleLabel ?? '', style: context.text.muted12),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          AppCard(
            icon: PhosphorIconsRegular.palette,
            title: 'Appearance',
            child: SegmentedButton<ThemeMode>(
              showSelectedIcon: false,
              segments: const [
                ButtonSegment(value: ThemeMode.light, label: Text('Light')),
                ButtonSegment(value: ThemeMode.dark, label: Text('Dark')),
                ButtonSegment(value: ThemeMode.system, label: Text('System')),
              ],
              selected: {mode},
              onSelectionChanged: (s) =>
                  ref.read(appThemeModeProvider.notifier).setMode(s.first),
            ),
          ),
          const Gap(24),
          AppButton.outline(
            label: 'Logout',
            icon: PhosphorIconsRegular.signOut,
            expanded: true,
            onPressed: () => ref.read(sessionProvider.notifier).logout(),
          ),
          const Gap(16),
          Center(
            child: Text(
              'v$version${env.isProduction ? '' : ' · ${env.env.label}'}',
              style: context.text.muted12,
            ),
          ),
        ],
      ),
    );
  }
}
