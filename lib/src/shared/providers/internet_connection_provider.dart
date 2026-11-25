import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'internet_connection_provider.g.dart';

/// `true` while any network interface is up. Good enough for banners and for
/// deciding whether to retry; the request itself is the real test.
@Riverpod(keepAlive: true)
Stream<bool> internetConnection(Ref ref) async* {
  final connectivity = Connectivity();
  bool online(List<ConnectivityResult> r) =>
      r.any((e) => e != ConnectivityResult.none);

  yield online(await connectivity.checkConnectivity());
  yield* connectivity.onConnectivityChanged.map(online).distinct();
}
