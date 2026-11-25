//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:api/src/auth/api_key_auth.dart';
import 'package:api/src/auth/basic_auth.dart';
import 'package:api/src/auth/bearer_auth.dart';
import 'package:api/src/auth/oauth.dart';
import 'package:api/src/api/appraisal_api.dart';
import 'package:api/src/api/attendance_api.dart';
import 'package:api/src/api/auth_api.dart';
import 'package:api/src/api/employee_api.dart';
import 'package:api/src/api/festival_hunt_api.dart';
import 'package:api/src/api/holiday_api.dart';
import 'package:api/src/api/kudos_api.dart';
import 'package:api/src/api/leave_api.dart';
import 'package:api/src/api/notice_api.dart';
import 'package:api/src/api/payment_api.dart';
import 'package:api/src/api/setting_api.dart';

class Api {
  static const String basePath =
      r'https://api.karma.blackcurrantlabs.com/production';

  final Dio dio;
  Api({
    Dio? dio,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  }) : this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor)
              as OAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor)
              as BearerAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor)
              as BasicAuthInterceptor)
          .authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this
                  .dio
                  .interceptors
                  .firstWhere((element) => element is ApiKeyAuthInterceptor)
              as ApiKeyAuthInterceptor)
          .apiKeys[name] = apiKey;
    }
  }

  /// Get AppraisalApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AppraisalApi getAppraisalApi() {
    return AppraisalApi(dio);
  }

  /// Get AttendanceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AttendanceApi getAttendanceApi() {
    return AttendanceApi(dio);
  }

  /// Get AuthApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthApi getAuthApi() {
    return AuthApi(dio);
  }

  /// Get EmployeeApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EmployeeApi getEmployeeApi() {
    return EmployeeApi(dio);
  }

  /// Get FestivalHuntApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  FestivalHuntApi getFestivalHuntApi() {
    return FestivalHuntApi(dio);
  }

  /// Get HolidayApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  HolidayApi getHolidayApi() {
    return HolidayApi(dio);
  }

  /// Get KudosApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  KudosApi getKudosApi() {
    return KudosApi(dio);
  }

  /// Get LeaveApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  LeaveApi getLeaveApi() {
    return LeaveApi(dio);
  }

  /// Get NoticeApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  NoticeApi getNoticeApi() {
    return NoticeApi(dio);
  }

  /// Get PaymentApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PaymentApi getPaymentApi() {
    return PaymentApi(dio);
  }

  /// Get SettingApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SettingApi getSettingApi() {
    return SettingApi(dio);
  }
}
