enum ErrorType {
  /// Backend answered with an error body (`{ message }`).
  response,

  /// 401 — the token is missing, expired or revoked.
  unauthorized,

  /// 403 — signed in, but this endpoint is admin-only.
  forbidden,

  /// No connectivity / timeouts.
  connection,

  /// Response could not be parsed into the expected model.
  parse,
  other,
}

class AppException implements Exception {
  AppException({
    required this.message,
    required this.type,
    this.data,
    this.statusCode,
  });

  final String message;
  final ErrorType type;
  final dynamic data;

  /// HTTP status of the failed response, when there was one.
  final int? statusCode;

  bool get isUnauthorized => type == ErrorType.unauthorized;
  bool get isForbidden => type == ErrorType.forbidden;
  bool get isConnection => type == ErrorType.connection;

  @override
  String toString() {
    return '''
          message : $message
          data : $data
          type : $type
          statusCode : $statusCode
            ''';
  }
}
