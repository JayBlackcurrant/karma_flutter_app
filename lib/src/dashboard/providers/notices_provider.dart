import 'package:api/api.dart';
import 'package:karma/core/extension/future.dart';
import 'package:karma/core/instances/api_client.dart';
import 'package:karma/core/mixins/action_mixin.dart';
import 'package:karma/core/utils/cache_for.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notices_provider.g.dart';

/// `GET /notice` plus the notice actions: acknowledge (everyone) and
/// add / edit / delete (admin).
@riverpod
class Notices extends _$Notices with ActionMixin {
  NoticeApi get _api => ref.read(apiProvider).getNoticeApi();

  @override
  Future<List<Notice>> build() async {
    cacheFor(ref, const Duration(minutes: 5));
    return _api.getNotices().guard<List<Notice>>();
  }

  /// "Read & understood". Updates the card in place instead of refetching.
  Future<void> acknowledge(Notice notice) async {
    final id = notice.id;
    if (id == null) {
      return;
    }
    final ok = await runAction(
      () async {
        await _api.acknowledgeNotice(id: id).guardVoid();
        return true;
      },
      success: 'Noted. Thanks for reading it.',
    );
    if (ok != true) {
      return;
    }
    notice
      ..acknowledgedByMe = true
      ..acknowledgedOn = DateTime.now()
      ..acknowledgedCount = (notice.acknowledgedCount ?? 0) + 1;
    final list = state.value;
    if (list != null) {
      state = AsyncData([...list]);
    }
  }

  /// Admin: who has / hasn't acknowledged. Null on failure (toast shown).
  Future<NoticeAcknowledgements?> acknowledgements(int id) => runAction(
        () => _api
            .getNoticeAcknowledgements(id: id)
            .guard<NoticeAcknowledgements>(),
      );

  /// Admin: create (id == null) or edit. Posting emails everyone.
  Future<bool> save({
    int? id,
    required String title,
    required String description,
    required DateTime expiresOn,
  }) async {
    final body = NoticeRequest(
      title: title.trim(),
      description: description.trim(),
      expirationDate: expiresOn.millisecondsSinceEpoch,
    );
    final ok = await runAction(
      () async {
        if (id == null) {
          await _api.addNotice(noticeRequest: body).guardVoid();
        } else {
          await _api.editNotice(id: id, noticeRequest: body).guardVoid();
        }
        return true;
      },
      success: id == null
          ? "Notice posted. Everyone's been told, by email too."
          : 'Saved Changes',
    );
    if (ok == true) {
      ref.invalidateSelf();
    }
    return ok == true;
  }

  /// Admin: delete. Caller confirms first.
  Future<void> delete(int id) async {
    final ok = await runAction(
      () async {
        await _api.deleteNotice(id: id).guardVoid();
        return true;
      },
      success: 'Successfully deleted Notice',
    );
    final list = state.value;
    if (ok == true && list != null) {
      state = AsyncData(list.where((n) => n.id != id).toList());
    }
  }
}
