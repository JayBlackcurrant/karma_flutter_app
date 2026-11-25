import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for AuthApi
void main() {
  final instance = Api().getAuthApi();

  group(AuthApi, () {
    //Future<MessageResponse> forgotPassword(ForgotPasswordRequest forgotPasswordRequest) async
    test('test forgotPassword', () async {
      // TODO
    });

    //Future<AuthUser> getRole() async
    test('test getRole', () async {
      // TODO
    });

    //Future<LoginResponse> login(LoginRequest loginRequest) async
    test('test login', () async {
      // TODO
    });

    //Future<MessageResponse> updatePassword(String uuid, UpdatePasswordRequest updatePasswordRequest) async
    test('test updatePassword', () async {
      // TODO
    });

    //Future<MessageResponse> verifyUuid(String uuid) async
    test('test verifyUuid', () async {
      // TODO
    });
  });
}
