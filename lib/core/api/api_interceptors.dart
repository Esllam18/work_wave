// ============================================================================
// FILE 5: api_interceptors.dart
// ============================================================================
import 'package:dio/dio.dart';
import 'pref_helper.dart';

/// Interceptors for Dio client.
/// OPTIMIZED: Better error handling, token refresh, and performance monitoring
class ApiInterceptors {
  static InterceptorsWrapper getAuthInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        try {
          // Use sync method for instant access (HUGE PERFORMANCE BOOST!)
          final token = PrefHelper.getTokenSync();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        } catch (e) {
          // Don't block request if token fetch fails
          print('Auth interceptor error: $e');
        }
        return handler.next(options);
      },

      onResponse: (response, handler) {
        // Optional: Extract and save new token from response if API sends it
        try {
          if (response.data is Map<String, dynamic>) {
            final data = response.data as Map<String, dynamic>;
            if (data.containsKey('token')) {
              PrefHelper.saveToken(data['token'].toString());
            }
          }
        } catch (e) {
          // Silent fail - don't block response
        }
        return handler.next(response);
      },

      onError: (DioException error, handler) async {
        // Handle 401 Unauthorized - token expired
        if (error.response?.statusCode == 401) {
          try {
            // Clear invalid token
            await PrefHelper.clearToken();

            // Optional: Implement token refresh logic here
            // final newToken = await refreshToken();
            // if (newToken != null) {
            //   error.requestOptions.headers['Authorization'] = 'Bearer $newToken';
            //   return handler.resolve(await _retry(error.requestOptions));
            // }
          } catch (e) {
            print('Token refresh error: $e');
          }
        }
        return handler.next(error);
      },
    );
  }

  /// Optimized logging interceptor
  static LogInterceptor getLoggingInterceptor() {
    return LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: false, // Disable for less noise
      responseHeader: false,
      error: true,
      logPrint: (obj) {
        // Use print or your logging solution
        print(obj);
      },
    );
  }

  /// Performance monitoring interceptor
  static InterceptorsWrapper getPerformanceInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        options.extra['start_time'] = DateTime.now().millisecondsSinceEpoch;
        return handler.next(options);
      },
      onResponse: (response, handler) {
        final startTime = response.requestOptions.extra['start_time'] as int?;
        if (startTime != null) {
          final duration = DateTime.now().millisecondsSinceEpoch - startTime;
          print(
            '⚡ API Call: ${response.requestOptions.path} took ${duration}ms',
          );

          // Alert if request is slow
          if (duration > 3000) {
            print('⚠️ SLOW REQUEST WARNING: ${response.requestOptions.path}');
          }
        }
        return handler.next(response);
      },
      onError: (error, handler) {
        final startTime = error.requestOptions.extra['start_time'] as int?;
        if (startTime != null) {
          final duration = DateTime.now().millisecondsSinceEpoch - startTime;
          print(
            '❌ API Error: ${error.requestOptions.path} failed after ${duration}ms',
          );
        }
        return handler.next(error);
      },
    );
  }

  /// Helper to retry failed requests
  // ignore: unused_element
  static Future<Response> _retry(RequestOptions requestOptions) async {
    final dio = Dio();
    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      ),
    );
  }
}
