import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_info_provider.g.dart';

/// "1.0.0+1" — sent as the `App-Version` header and shown on the profile tab.
@Riverpod(keepAlive: true)
Future<String> packageInfo(Ref ref) async {
  final info = await PackageInfo.fromPlatform();
  return '${info.version}+${info.buildNumber}';
}
