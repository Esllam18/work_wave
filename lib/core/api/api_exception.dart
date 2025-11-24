import 'package:dio/dio.dart';
import 'api_error.dart';

class ApiException implements Exception {
  static ApiError handleError(dynamic error) {
    // Handle DioException
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          return ApiError('Request was cancelled', 499);

        case DioExceptionType.connectionTimeout:
          return ApiError(
            'Connection timeout. Please check your internet connection.',
            408,
          );

        case DioExceptionType.receiveTimeout:
          return ApiError(
            'Server took too long to respond. Please try again.',
            408,
          );

        case DioExceptionType.sendTimeout:
          return ApiError('Failed to send request. Please try again.', 408);

        case DioExceptionType.badResponse:
          return _handleBadResponse(error);

        case DioExceptionType.connectionError:
          return ApiError(
            'No internet connection. Please check your network.',
            503,
          );

        case DioExceptionType.badCertificate:
          return ApiError('Security certificate error', 495);

        case DioExceptionType.unknown:
          // Check if it's a network error
          if (error.message?.contains('SocketException') ?? false) {
            return ApiError('No internet connection', 503);
          }
          if (error.message?.contains('Failed host lookup') ?? false) {
            return ApiError(
              'Cannot reach server. Please check your connection.',
              503,
            );
          }
          return ApiError('Network error occurred. Please try again.', 503);
      }
    }

    // For non-Dio errors
    return ApiError('An unexpected error occurred: ${error.toString()}', 500);
  }

  /// Handle bad response errors
  static ApiError _handleBadResponse(DioException error) {
    if (error.response == null) {
      return ApiError('No response from server', 500);
    }

    final response = error.response!;
    final statusCode = response.statusCode ?? 500;
    final data = response.data;

    // Handle validation errors (422)
    if (statusCode == 422 && data is Map<String, dynamic>) {
      return _parseValidationError(data, statusCode);
    }

    // Handle standard error responses
    if (data is Map<String, dynamic>) {
      // Try to extract message
      if (data.containsKey('message')) {
        return ApiError(data['message'].toString(), statusCode);
      }

      // Try alternative message keys
      if (data.containsKey('error')) {
        final errorData = data['error'];
        if (errorData is String) {
          return ApiError(errorData, statusCode);
        }
        if (errorData is Map && errorData.containsKey('message')) {
          return ApiError(errorData['message'].toString(), statusCode);
        }
      }
    }

    // Handle by status code
    return _getErrorByStatusCode(statusCode);
  }

  /// Parse validation errors (422 status code)
  static ApiError _parseValidationError(
    Map<String, dynamic> data,
    int statusCode,
  ) {
    // Laravel-style validation errors
    if (data.containsKey('errors')) {
      final errors = data['errors'];

      if (errors is Map<String, dynamic> && errors.isNotEmpty) {
        // Get first error message
        final firstError = errors.values.first;

        if (firstError is List && firstError.isNotEmpty) {
          return ApiError(firstError[0].toString(), statusCode);
        }

        if (firstError is String) {
          return ApiError(firstError, statusCode);
        }
      }
    }

    // Fallback to message field
    if (data.containsKey('message')) {
      return ApiError(data['message'].toString(), statusCode);
    }

    return ApiError('Validation error occurred', statusCode);
  }

  /// Get user-friendly error message by status code
  static ApiError _getErrorByStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return ApiError('Bad request. Please check your input.', statusCode);
      case 401:
        return ApiError('Unauthorized. Please login again.', statusCode);
      case 403:
        return ApiError(
          'Access forbidden. You don\'t have permission.',
          statusCode,
        );
      case 404:
        return ApiError('Resource not found.', statusCode);
      case 405:
        return ApiError('Method not allowed.', statusCode);
      case 409:
        return ApiError(
          'Conflict occurred. Resource already exists.',
          statusCode,
        );
      case 422:
        return ApiError(
          'Validation error. Please check your input.',
          statusCode,
        );
      case 429:
        return ApiError('Too many requests. Please slow down.', statusCode);
      case 500:
        return ApiError('Server error. Please try again later.', statusCode);
      case 502:
        return ApiError(
          'Bad gateway. Server is temporarily unavailable.',
          statusCode,
        );
      case 503:
        return ApiError(
          'Service unavailable. Please try again later.',
          statusCode,
        );
      case 504:
        return ApiError(
          'Gateway timeout. Server took too long to respond.',
          statusCode,
        );
      default:
        return ApiError('Error occurred (Code: $statusCode)', statusCode);
    }
  }
}
