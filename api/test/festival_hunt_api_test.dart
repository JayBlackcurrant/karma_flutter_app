import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for FestivalHuntApi
void main() {
  final instance = Api().getFestivalHuntApi();

  group(FestivalHuntApi, () {
    //Future<ActiveHuntResponse> getActiveHunt() async
    test('test getActiveHunt', () async {
      // TODO
    });

    //Future<FestivalThemeResponse> getFestivalTheme() async
    test('test getFestivalTheme', () async {
      // TODO
    });
  });
}
