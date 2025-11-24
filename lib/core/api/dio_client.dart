import 'package:dio/dio.dart';
import 'package:work_wave/core/api/api_interceptors.dart';
import 'api_constants.dart';

class DioClient {
  static DioClient? _instance;
  late final Dio _dio;

  // Private constructor
  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(
          milliseconds: ApiConstants.connectTimeout,
        ),
        receiveTimeout: const Duration(
          milliseconds: ApiConstants.receiveTimeout,
        ),
        sendTimeout: const Duration(milliseconds: ApiConstants.sendTimeout),
        headers: ApiConstants.headers,

        // Performance optimizations
        followRedirects: true,
        maxRedirects: ApiConstants.maxRedirects,
        validateStatus: (status) {
          // Accept all status codes to handle them in ApiException
          return status != null && status < 500;
        },

        // Response type optimization
        responseType: ResponseType.json,

        // Content type
        contentType: Headers.jsonContentType,
      ),
    );

    // Add interceptors in optimal order
    _dio.interceptors.add(ApiInterceptors.getAuthInterceptor());

    // Only add logging in debug mode for performance
    if (ApiConstants.enableLogging) {
      _dio.interceptors.add(ApiInterceptors.getLoggingInterceptor());
    }

    // Add performance monitoring interceptor (optional)
    _dio.interceptors.add(ApiInterceptors.getPerformanceInterceptor());
  }

  // Factory constructor for singleton
  factory DioClient() {
    _instance ??= DioClient._internal();
    return _instance!;
  }

  Dio get client => _dio;

  /// Clear instance (useful for testing or resetting)
  static void dispose() {
    _instance?._dio.close(force: true);
    _instance = null;
  }
}
