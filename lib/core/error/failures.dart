import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base failure class using Freezed for sealed union types
@freezed
class Failure with _$Failure {
  /// Server error with message
  const factory Failure.server(String message) = ServerFailure;

  /// Network connectivity error
  const factory Failure.network() = NetworkFailure;

  /// Unauthorized access (401)
  const factory Failure.unauthorized() = UnauthorizedFailure;

  /// Validation error with message
  const factory Failure.validation(String message) = ValidationFailure;

  /// Resource not found (404)
  const factory Failure.notFound(String message) = NotFoundFailure;

  /// Forbidden access (403)
  const factory Failure.forbidden(String message) = ForbiddenFailure;

  /// Rate limit exceeded (429)
  const factory Failure.rateLimit(String message) = RateLimitFailure;

  /// Unexpected error
  const factory Failure.unexpected(String message) = UnexpectedFailure;

  /// Cache error
  const factory Failure.cache(String message) = CacheFailure;
}

/// Extension to get user-friendly error messages
extension FailureX on Failure {
  String get message => when(
        server: (msg) => msg.isEmpty ? 'Server error occurred' : msg,
        network: () => 'No internet connection. Please check your network.',
        unauthorized: () => 'Session expired. Please login again.',
        validation: (msg) => msg,
        notFound: (msg) => msg.isEmpty ? 'Resource not found' : msg,
        forbidden: (msg) =>
            msg.isEmpty ? 'You don\'t have permission to access this' : msg,
        rateLimit: (msg) =>
            msg.isEmpty ? 'Too many requests. Please try again later.' : msg,
        unexpected: (msg) => msg.isEmpty ? 'Something went wrong' : msg,
        cache: (msg) => msg.isEmpty ? 'Cache error occurred' : msg,
      );
}
