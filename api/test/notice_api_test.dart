import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for NoticeApi
void main() {
  final instance = Api().getNoticeApi();

  group(NoticeApi, () {
    //Future<MessageResponse> acknowledgeNotice(int id) async
    test('test acknowledgeNotice', () async {
      // TODO
    });

    //Future<MessageResponse> addNotice(NoticeRequest noticeRequest) async
    test('test addNotice', () async {
      // TODO
    });

    //Future<MessageResponse> deleteNotice(int id) async
    test('test deleteNotice', () async {
      // TODO
    });

    //Future<MessageResponse> editNotice(int id, NoticeRequest noticeRequest) async
    test('test editNotice', () async {
      // TODO
    });

    //Future<NoticeAcknowledgements> getNoticeAcknowledgements(int id) async
    test('test getNoticeAcknowledgements', () async {
      // TODO
    });

    //Future<List<Notice>> getNotices() async
    test('test getNotices', () async {
      // TODO
    });
  });
}
