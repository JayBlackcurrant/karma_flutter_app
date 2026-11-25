import 'package:api/api.dart' as models;
import 'package:karma/app_config.dart';
import 'package:karma/core/instances/dio_instance.dart';
import 'package:karma/core/interceptors/token_interceptor.dart';
import 'package:karma/core/interceptors/unauthorized_interceptor.dart';
import 'package:karma/src/auth/providers/session_provider.dart';
import 'package:karma/src/more/providers/package_info_provider.dart';
import 'package:karma/src/shared/providers/token_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

/// The single REST client. Feature providers grab a typed API from it:
/// `ref.read(apiProvider).getLeaveApi()`.
@Riverpod(keepAlive: true)
models.Api api(Ref ref) {
  // Deliberately does NOT watch tokenProvider: the interceptor reads the token
  // per request, so signing in / out never rebuilds Dio under providers that
  // already captured an API instance in build().
  final config = ref.watch(appConfigProvider);
  final version = ref.read(packageInfoProvider).value ?? 'unknown_version';

  return models.Api(
    dio: DioInstance(
      baseUrl: config.env.baseUrl,
      version: version,
      tokenInterceptor: TokenInterceptor(
        getToken: () => ref.mounted ? ref.read(tokenProvider) : '',
      ),
      unauthorizedInterceptor: UnauthorizedInterceptor(
        onUnauthorized: () async {
          if (!ref.mounted) {
            return;
          }
          await ref.read(sessionProvider.notifier).expire();
        },
      ),
    ),
    // Our own interceptors handle auth; skip the generator's defaults.
    interceptors: const [],
  );
}
