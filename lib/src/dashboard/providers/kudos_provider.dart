import 'package:api/api.dart';
import 'package:karma/core/extension/future.dart';
import 'package:karma/core/extension/string.dart';
import 'package:karma/core/instances/api_client.dart';
import 'package:karma/core/mixins/action_mixin.dart';
import 'package:karma/core/utils/cache_for.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kudos_provider.g.dart';

/// `GET /kudos` — the public thank-you wall, newest first.
@riverpod
class KudosWall extends _$KudosWall with ActionMixin {
  KudosApi get _api => ref.read(apiProvider).getKudosApi();

  @override
  Future<List<Kudos>> build() async {
    cacheFor(ref, const Duration(minutes: 5));
    return _api.getKudosWall().guard<List<Kudos>>();
  }

  /// `POST /kudos` → prepend the created kudos. Returns true on success so
  /// the form can reset.
  Future<bool> give({
    required int toEmployeeId,
    required String message,
  }) async {
    final created = await runAction(
      () => _api
          .giveKudos(
            kudosRequest: KudosRequest(
              toEmployeeId: toEmployeeId,
              message: message.trim(),
            ),
          )
          .guard<Kudos>(),
    );
    if (created == null) {
      return false;
    }
    'Kudos sent to ${created.toName ?? 'your colleague'}. Good karma, delivered.'
        .toToast();
    state = AsyncData([created, ...state.value ?? []]);
    return true;
  }

  /// `DELETE /kudos/{id}`. Caller confirms first.
  Future<void> remove(Kudos kudos) async {
    final id = kudos.id;
    if (id == null) {
      return;
    }
    final ok = await runAction(() async {
      await _api.removeKudos(id: id).guardVoid();
      return true;
    });
    if (ok == true) {
      state = AsyncData([...?state.value?.where((k) => k.id != id)]);
    }
  }
}

/// `GET /kudos/colleagues` — people you can send kudos to.
@riverpod
Future<List<Colleague>> colleagues(Ref ref) async {
  cacheFor(ref, const Duration(minutes: 30));
  final list = await ref
      .read(apiProvider)
      .getKudosApi()
      .getColleagues()
      .guard<List<Colleague>>();
  return [...list]..sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
}
