import 'package:api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karma/core/extension/model.dart';
import 'package:karma/core/interceptors/role_override_interceptor.dart';

/// Stub adapter: answers every request with [body] as JSON.
class _JsonAdapter implements HttpClientAdapter {
  _JsonAdapter(this.body);

  final String body;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async =>
      ResponseBody.fromString(
        body,
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );

  @override
  void close({bool force = false}) {}
}

void main() {
  const employee =
      '{"employeeId":7,"name":"Jay","email":"j@x.com","role":"Employee","iat":1,"exp":2}';

  Api apiWith({required bool override}) {
    final dio = Dio(BaseOptions(baseUrl: 'https://example.test/'))
      ..httpClientAdapter = _JsonAdapter(employee);
    if (override) {
      dio.interceptors.add(RoleOverrideInterceptor());
    }
    return Api(dio: dio, interceptors: const []);
  }

  test('getRole comes back as ADMIN through the generated client', () async {
    final res = await apiWith(override: true).getAuthApi().getRole();
    expect(res.data!.role, Role.ADMIN);
    expect(res.data!.isAdmin, isTrue);
    // Everything else is untouched.
    expect(res.data!.employeeId, 7);
    expect(res.data!.name, 'Jay');
  });

  test('without the interceptor the real role is kept', () async {
    final res = await apiWith(override: false).getAuthApi().getRole();
    expect(res.data!.role, Role.employee);
  });

  test('other endpoints are not touched', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://example.test/'))
      ..httpClientAdapter = _JsonAdapter('{"role":"Employee"}')
      ..interceptors.add(RoleOverrideInterceptor());
    final res = await dio.get<Map<String, dynamic>>('/employee/7');
    expect(res.data!['role'], 'Employee');
  });
}
