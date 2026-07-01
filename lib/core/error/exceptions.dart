/// Base exception class for data layer
class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, [this.statusCode]);

  @override
  String toString() => 'AppException: $message (Status: $statusCode)';
}

/// Server exception (5xx errors)
class ServerException extends AppException {
  ServerException(super.message, [super.statusCode]);
}

/// Network exception (no internet)
class NetworkException extends AppException {
  NetworkException(super.message, [super.statusCode]);
}

/// Unauthorized exception (401)
class UnauthorizedException extends AppException {
  UnauthorizedException([super.message = 'Unauthorized', super.statusCode = 401]);
}

/// Validation exception (400)
class ValidationException extends AppException {
  ValidationException(super.message, [super.statusCode = 400]);
}

/// Not found exception (404)
class NotFoundException extends AppException {
  NotFoundException(super.message, [super.statusCode = 404]);
}

/// Forbidden exception (403)
class ForbiddenException extends AppException {
  ForbiddenException(super.message, [super.statusCode = 403]);
}

/// Rate limit exception (429)
class RateLimitException extends AppException {
  RateLimitException(super.message, [super.statusCode = 429]);
}

/// Cache exception
class CacheException extends AppException {
  CacheException(super.message, [super.statusCode]);
}
