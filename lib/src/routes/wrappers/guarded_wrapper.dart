import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karma/core/extension/context.dart';

/// Root of every signed-in route. Anything that must wrap the whole authed app
/// (status-bar style, festival backdrop, connectivity banner…) goes here.
@RoutePage()
class GuardedPageWrapper extends StatelessWidget {
  const GuardedPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.isDark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: const AutoRouter(),
    );
  }
}
