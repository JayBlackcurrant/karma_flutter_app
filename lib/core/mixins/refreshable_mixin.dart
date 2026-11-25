import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';

/// Pull-to-refresh for pages backed by async providers:
///
/// ```dart
/// class _DashboardState extends ConsumerState<DashboardPage>
///     with RefreshableMixin {
///   @override
///   List<Refreshable<Future<Object?>>> get refreshables =>
///       [leaveSummaryProvider.future, holidaysProvider.future];
///   ...
///   RefreshIndicator(onRefresh: refresh, child: ...)
/// }
/// ```
///
/// The spinner stays up until every provider has re-fetched; failures are left
/// for each section's `unfold` to show.
mixin RefreshableMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  List<Refreshable<Future<Object?>>> get refreshables;

  Future<void> refresh() async {
    await Future.wait(
      refreshables.map(
        (provider) => ref.refresh(provider).then<void>((_) {}, onError: (_) {}),
      ),
    );
  }
}
