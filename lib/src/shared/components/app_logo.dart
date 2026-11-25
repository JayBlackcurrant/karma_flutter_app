import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/constants/app_constants.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/src/gen/assets.gen.dart';

/// Hexagon logo, optionally with the KARMA wordmark and tagline.
class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size = 32, this.showWordmark = true});

  final double size;
  final bool showWordmark;

  @override
  Widget build(BuildContext context) {
    final mark = Assets.svg.logo.svg(
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(context.colors.foreground, BlendMode.srcIn),
    );
    if (!showWordmark) {
      return mark;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        mark,
        const Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              kAppName.toUpperCase(),
              style: context.text.bold24.copyWith(fontSize: size * 0.6),
            ),
            Text(
              kTagline,
              style: context.text.tagline.copyWith(fontSize: size * 0.34),
            ),
          ],
        ),
      ],
    );
  }
}
