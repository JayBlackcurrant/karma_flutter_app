import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Holds a provider's result for [duration] after its last listener goes away,
/// then lets it be disposed.
///
/// The middle ground between `@riverpod` (thrown away the moment the screen is
/// popped) and `@Riverpod(keepAlive: true)` (kept for the life of the process).
/// [duration] is deliberately not defaulted: how stale a given list may go is a
/// decision per provider, and it should be readable at the call site.
void cacheFor(Ref ref, Duration duration) {
  final link = ref.keepAlive();
  Timer? timer;

  ref
    ..onDispose(() => timer?.cancel())
    ..onCancel(() {
      timer?.cancel();
      timer = Timer(duration, link.close);
    })
    ..onResume(() {
      timer?.cancel();
      timer = null;
    });
}
