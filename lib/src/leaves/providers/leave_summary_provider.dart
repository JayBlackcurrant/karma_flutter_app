import 'package:api/api.dart';
import 'package:karma/core/extension/future.dart';
import 'package:karma/core/instances/api_client.dart';
import 'package:karma/core/utils/cache_for.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leave_summary_provider.g.dart';

/// `GET /leave` — my leaves plus balances. Shared by the dashboard glance
/// tiles and the Leaves tab.
@riverpod
Future<LeaveSummary> leaveSummary(Ref ref) async {
  cacheFor(ref, const Duration(minutes: 5));
  return ref.read(apiProvider).getLeaveApi().getLeaves().guard<LeaveSummary>();
}
