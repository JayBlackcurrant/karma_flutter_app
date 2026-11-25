import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for KudosApi
void main() {
  final instance = Api().getKudosApi();

  group(KudosApi, () {
    //Future<List<Colleague>> getColleagues() async
    test('test getColleagues', () async {
      // TODO
    });

    //Future<List<Kudos>> getKudosReceived(int employeeId, { String from, String to }) async
    test('test getKudosReceived', () async {
      // TODO
    });

    //Future<List<Kudos>> getKudosWall({ int limit }) async
    test('test getKudosWall', () async {
      // TODO
    });

    //Future<Kudos> giveKudos(KudosRequest kudosRequest) async
    test('test giveKudos', () async {
      // TODO
    });

    //Future<MessageResponse> removeKudos(int id) async
    test('test removeKudos', () async {
      // TODO
    });
  });
}
