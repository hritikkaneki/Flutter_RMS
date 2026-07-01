import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/app_constants.dart';
import '../storage/secure_storage.dart';

part 'dio_client.g.dart';

/// Dio client provider
@riverpod
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.apiBaseUrl,
      connectTimeout: AppConstants.connectTimeout,
      receiveTimeout: AppConstants.receiveTimeout,
      sendTimeout: AppConstants.apiTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // Add interceptors
  dio.interceptors.add(
    AuthInterceptor(ref.read(secureStorageProvider)),
  );

  dio.interceptors.add(
    LoggingInterceptor(ref.read(loggerProvider)),
  );

  dio.interceptors.add(
    ErrorInterceptor(ref.read(loggerProvider)),
  );

  return dio;
}

/// Logger provider
@riverpod
Logger logger(Ref ref) {
  return Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );
}

/// Auth interceptor - adds JWT token to requests
class AuthInterceptor extends Interceptor {
  final SecureStorage _secureStorage;

  AuthInterceptor(this._secureStorage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip auth for login/refresh endpoints
    if (options.path.contains('/auth/login') ||
        options.path.contains('/auth/refresh')) {
      return handler.next(options);
    }

    // Add JWT token
    final token = await _secureStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }
}

/// Logging interceptor - logs requests and responses
class LoggingInterceptor extends Interceptor {
  final Logger _logger;

  LoggingInterceptor(this._logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i(
      '🌐 REQUEST[${options.method}] => ${options.uri}\n'
      'Headers: ${options.headers}\n'
      'Data: ${options.data}',
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i(
      '✅ RESPONSE[${response.statusCode}] => ${response.requestOptions.uri}\n'
      'Data: ${response.data}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
      '❌ ERROR[${err.response?.statusCode}] => ${err.requestOptions.uri}\n'
      'Message: ${err.message}\n'
      'Response: ${err.response?.data}',
    );
    handler.next(err);
  }
}

/// Error interceptor - handles 401 and retry logic
class ErrorInterceptor extends Interceptor {
  final Logger _logger;

  ErrorInterceptor(this._logger);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Handle 401 Unauthorized
    if (err.response?.statusCode == 401) {
      _logger.w('🔒 Unauthorized - Token expired or invalid');
      // TODO: Implement token refresh logic here
      // 1. Get refresh token from secure storage
      // 2. Call /auth/refresh endpoint
      // 3. Update access token
      // 4. Retry original request
      // For now, just pass the error
    }

    return handler.next(err);
  }
}

/// Helper extension to parse API response
extension ResponseExtensions on Response {
  /// Extract data from standard API response format
  /// Expected: { "success": true, "message": "...", "data": {...} }
  T parseData<T>() {
    if (data is Map<String, dynamic>) {
      return data['data'] as T;
    }
    return data as T;
  }

  /// Extract message from response
  String? get message {
    if (data is Map<String, dynamic>) {
      return data['message'] as String?;
    }
    return null;
  }

  /// Check if request was successful
  bool get isSuccess {
    if (data is Map<String, dynamic>) {
      return data['success'] == true;
    }
    return statusCode != null && statusCode! >= 200 && statusCode! < 300;
  }
}
