import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karma/app.dart';
import 'package:karma/core/extension/log.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Crash reporting hooks. Swap the log calls for Crashlytics once a Firebase
  // project exists for Karma (see README → Firebase).
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (!kDebugMode) {
      details.exceptionAsString().logError();
    }
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    '$error\n$stack'.logError();
    return true;
  };

  runApp(
    ProviderScope(
      // Failed providers surface their error to the UI instead of silently
      // retrying network calls behind the user's back.
      retry: (retryCount, error) => null,
      child: const App(),
    ),
  );
}
