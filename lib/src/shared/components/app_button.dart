import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/src/shared/components/app_loader.dart';

enum AppButtonVariant { primary, outline, ghost, destructive }

/// shadcn-style button: primary (filled), outline, ghost, destructive — with a
/// built-in loading state so callers don't juggle spinners.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.loading = false,
    this.expanded = false,
    this.variant = AppButtonVariant.primary,
  });

  const AppButton.outline({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.loading = false,
    this.expanded = false,
  }) : variant = AppButtonVariant.outline;

  const AppButton.ghost({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.loading = false,
    this.expanded = false,
  }) : variant = AppButtonVariant.ghost;

  const AppButton.destructive({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.loading = false,
    this.expanded = false,
  }) : variant = AppButtonVariant.destructive;

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool loading;
  final bool expanded;
  final AppButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final onTap = loading ? null : onPressed;
    final child = Row(
      mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (loading)
          const AppLoader.small()
        else if (icon != null)
          Icon(icon, size: 16),
        if (loading || icon != null) const Gap(8),
        Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
      ],
    );

    final button = switch (variant) {
      AppButtonVariant.primary =>
        ElevatedButton(onPressed: onTap, child: child),
      AppButtonVariant.destructive => ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: c.destructive,
            foregroundColor: Colors.white,
          ),
          child: child,
        ),
      AppButtonVariant.outline =>
        OutlinedButton(onPressed: onTap, child: child),
      AppButtonVariant.ghost => TextButton(onPressed: onTap, child: child),
    };

    return expanded ? SizedBox(width: double.infinity, child: button) : button;
  }
}
