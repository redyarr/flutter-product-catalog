import 'package:equatable/equatable.dart';

/// Sealed domain failure hierarchy exposed safely to the presentation layer.
///
/// Raw exception details and stack traces are never propagated to UI widgets.
sealed class Failure extends Equatable {
  const Failure(this.userMessage);

  final String userMessage;

  @override
  List<Object?> get props => <Object?>[userMessage];
}

/// Connectivity or transport failure.
final class NetworkFailure extends Failure {
  const NetworkFailure([
    super.userMessage =
        'Unable to reach the catalog service. Please check your connection and try again.',
  ]);
}

/// Request exceeded the configured network timeout.
final class TimeoutFailure extends Failure {
  const TimeoutFailure([
    super.userMessage =
        'The catalog request timed out. Please try again in a moment.',
  ]);
}

/// Backend returned an unexpected HTTP status code.
final class ServerFailure extends Failure {
  const ServerFailure([
    super.userMessage =
        'The catalog service is temporarily unavailable. Please try again shortly.',
  ]);
}

/// Payload did not satisfy defensive schema validation.
final class DataParsingFailure extends Failure {
  const DataParsingFailure([
    super.userMessage =
        'We received an unexpected catalog response. Please try again.',
  ]);
}
