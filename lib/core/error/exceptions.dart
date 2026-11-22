/// Low-level data-layer exceptions mapped to domain [Failure] types in repositories.
sealed class AppException implements Exception {
  const AppException([this.message = '']);

  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

/// Raised when the transport layer cannot establish or complete a connection.
final class NetworkException extends AppException {
  const NetworkException([super.message]);
}

/// Raised when a network request exceeds [ApiConstants.timeout].
final class TimeoutException extends AppException {
  const TimeoutException([super.message]);
}

/// Raised when the backend responds with a non-success HTTP status code.
final class ServerException extends AppException {
  const ServerException({required this.statusCode, String message = ''})
      : super(message);

  final int statusCode;
}

/// Raised when the JSON payload is malformed or fails defensive schema checks.
final class DataParsingException extends AppException {
  const DataParsingException([super.message]);
}
