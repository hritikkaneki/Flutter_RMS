// lib/core/network/interceptors/auth_interceptor.dart
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:restaurant_management_system/core/network/api_endpoints.dart';
import 'package:restaurant_management_system/core/storage/secure_storage.dart';
import 'package:restaurant_management_system/core/utils/logger.dart';

class _AuthInterceptor extends Interceptor {
  final SecureStorage _secureStorage;
  final Dio _mainDio;

  bool _isRefreshing = false;
  final List<Map<String, dynamic>> _requestQueue = [];

  _AuthInterceptor(this._secureStorage, this._mainDio);

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final token = await _secureStorage.getAccessToken();
    if (token != null && !options.headers.containsKey('Authorization')) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }


  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        !err.requestOptions.path.contains(ApiEndpoints.login)) {

      final requestOptions = err.requestOptions;

      if (_isRefreshing) {
        _requestQueue.add({
          'options': requestOptions,
          'handler': handler,
        });
        return;
      }


      _isRefreshing = true;

      try {
        final refreshToken = await _secureStorage.getRefreshToken();
        if (refreshToken == null) throw DioException(requestOptions: requestOptions);

        final refreshDio = Dio(BaseOptions(baseUrl: ApiEndpoints.refreshToken));

        final response = await refreshDio.post(
          ApiEndpoints.refreshToken,
          data: {'refreshToken': refreshToken},
        );

        if (response.statusCode == 200 && response.data != null) {
          // Cast the payload wrapper into a type-safe map configuration
          final responseData = response.data as Map<String, dynamic>;

          // Cast specific fields to pure String values
          final newAccessToken = responseData['accessToken'] as String;
          final newRefreshToken = responseData['refreshToken'] as String;

          // Use your specific save methods safely
          await _secureStorage.saveAccessToken(newAccessToken);
          await _secureStorage.saveRefreshToken(newRefreshToken);


          requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
          final clonedResponse = await _mainDio.fetch(requestOptions);
          handler.resolve(clonedResponse);

          for (final queued in _requestQueue) {
            final opts = queued['options'] as RequestOptions;
            final hndlr = queued['handler'] as ErrorInterceptorHandler;

            opts.headers['Authorization'] = 'Bearer $newAccessToken';
            final res = await _mainDio.fetch(opts);
            hndlr.resolve(res);
          }
          _requestQueue.clear();
          return;
        }
      } catch (e) {
        _requestQueue.clear();
        // Use your specific clear helper method
        await _secureStorage.clearAuthTokens();

        //AppLogger.e("Session expired. Discarding auth state.");
        return handler.next(err);
      } finally {
        _isRefreshing = false;
      }
    }

    return handler.next(err);
  }
}
