import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/core/extension/string.dart';
import 'package:karma/src/routes/app_router.gr.dart';
import 'package:karma/src/shared/components/app_logo.dart';
import 'package:karma/src/shared/providers/user_provider.dart';
import 'package:karma/src/theme/providers/theme_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Signed-in shell. The web sidebar becomes a bottom navigation bar; the
/// web top bar (theme toggle) becomes the app bar.
@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const _tabs = [
    (
      label: 'Dashboard',
      icon: PhosphorIconsRegular.squaresFour,
      active: PhosphorIconsFill.squaresFour,
    ),
    (
      label: 'Leaves',
      icon: PhosphorIconsRegular.calendarBlank,
      active: PhosphorIconsFill.calendarBlank,
    ),
    (
      label: 'Appraisal',
      icon: PhosphorIconsRegular.clipboardText,
      active: PhosphorIconsFill.clipboardText,
    ),
    (
      label: 'Pay Slips',
      icon: PhosphorIconsRegular.envelopeSimple,
      active: PhosphorIconsFill.envelopeSimple,
    ),
    (
      label: 'Attendance',
      icon: PhosphorIconsRegular.clockCountdown,
      active: PhosphorIconsFill.clockCountdown,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return AutoTabsRouter(
      routes: const [
        DashboardRoute(),
        LeavesRoute(),
        AppraisalRoute(),
        PaySlipsRoute(),
        AttendanceRoute(),
      ],
      builder: (context, child) {
        final tabs = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 16,
            title: const AppLogo(size: 28),
            actions: [
              IconButton(
                tooltip: 'Toggle theme',
                icon: Icon(
                  context.isDark
                      ? PhosphorIconsRegular.sun
                      : PhosphorIconsRegular.moon,
                  size: 20,
                ),
                onPressed: () => ref
                    .read(appThemeModeProvider.notifier)
                    .toggle(Theme.of(context).brightness),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () => context.router.push(const ProfileRoute()),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: context.colors.muted,
                    child: Text(
                      user?.name.initials ?? '?',
                      style: context.text.medium12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: tabs.activeIndex,
            onDestinationSelected: tabs.setActiveIndex,
            destinations: [
              for (final t in _tabs)
                NavigationDestination(
                  icon: Icon(t.icon),
                  selectedIcon: Icon(t.active),
                  label: t.label,
                ),
            ],
          ),
        );
      },
    );
  }
}
