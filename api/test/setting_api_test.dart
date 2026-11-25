import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for SettingApi
void main() {
  final instance = Api().getSettingApi();

  group(SettingApi, () {
    //Future<Settings> getSettings() async
    test('test getSettings', () async {
      // TODO
    });

    //Future<Settings> updateSettings(Settings settings) async
    test('test updateSettings', () async {
      // TODO
    });
  });
}
