import 'package:auto_route/auto_route.dart';
import 'package:karma/src/routes/app_router.gr.dart';
import 'package:karma/src/routes/guards/auth_guard.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
Raw<AppRouter> appRouter(Ref ref) {
  return AppRouter(ref);
}

/// Mirrors the web route tree (see KARMA_REVERSE_ENGINEERING.md §4):
///
/// ```
/// /splash
/// /sign-in
/// /no-internet
/// /user                      AuthGuard
///   ''  HomeRoute (tabs)
///       dashboard · leaves · appraisal · pay-slips · attendance
///   profile
/// ```
///
/// Admin-only pages go under `/user` with `guards: [AdminGuard(_ref)]`.
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter(this._ref);

  final Ref _ref;

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/splash', initial: true),
        AutoRoute(page: SignInRoute.page, path: '/sign-in'),
        AutoRoute(page: NoInternetRoute.page, path: '/no-internet'),
        AutoRoute(
          page: GuardedRouteWrapper.page,
          path: '/user',
          guards: [AuthGuard(_ref)],
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: '',
              children: [
                AutoRoute(page: DashboardRoute.page, path: 'dashboard'),
                AutoRoute(page: LeavesRoute.page, path: 'leaves'),
                AutoRoute(page: AppraisalRoute.page, path: 'appraisal'),
                AutoRoute(page: PaySlipsRoute.page, path: 'pay-slips'),
                AutoRoute(page: AttendanceRoute.page, path: 'attendance'),
              ],
            ),
            AutoRoute(page: ProfileRoute.page, path: 'profile'),
          ],
        ),
        RedirectRoute(path: '*', redirectTo: '/splash'),
      ];
}
