import 'package:dio/dio.dart';
import 'api_exception.dart';
import 'dio_client.dart';

class ApiService {
  // Singleton instance for reuse
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  late final DioClient _dioClient;

  ApiService._internal() {
    _dioClient = DioClient();
  }

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      final response = await _dioClient.client.get(
        endpoint,
        queryParameters: queryParams,
        cancelToken: cancelToken,
        options: options,
      );
      return _processResponse(response);
    } catch (e) {
      throw ApiException.handleError(e);
    }
  }

  Future<dynamic> post(
    String endpoint, {
    dynamic data,
    bool isFormData = false,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    Options? options,
  }) async {
    try {
      final response = await _dioClient.client.post(
        endpoint,
        data: isFormData ? FormData.fromMap(data) : data,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        options: options,
      );
      return _processResponse(response);
    } catch (e) {
      throw ApiException.handleError(e);
    }
  }

  Future<dynamic> put(
    String endpoint, {
    dynamic data,
    bool isFormData = false,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    Options? options,
  }) async {
    try {
      final response = await _dioClient.client.put(
        endpoint,
        data: isFormData ? FormData.fromMap(data) : data,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        options: options,
      );
      return _processResponse(response);
    } catch (e) {
      throw ApiException.handleError(e);
    }
  }

  Future<dynamic> patch(
    String endpoint, {
    dynamic data,
    bool isFormData = false,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      final response = await _dioClient.client.patch(
        endpoint,
        data: isFormData ? FormData.fromMap(data) : data,
        cancelToken: cancelToken,
        options: options,
      );
      return _processResponse(response);
    } catch (e) {
      throw ApiException.handleError(e);
    }
  }

  Future<dynamic> delete(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    dynamic data,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      final response = await _dioClient.client.delete(
        endpoint,
        queryParameters: queryParams,
        data: data,
        cancelToken: cancelToken,
        options: options,
      );
      return _processResponse(response);
    } catch (e) {
      throw ApiException.handleError(e);
    }
  }

  Future<void> downloadFile(
    String url,
    String savePath, {
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      await _dioClient.client.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
        queryParameters: queryParams,
      );
    } catch (e) {
      throw ApiException.handleError(e);
    }
  }

  Future<dynamic> uploadFile(
    String endpoint,
    String filePath,
    String fileKey, {
    Map<String, dynamic>? data,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        fileKey: await MultipartFile.fromFile(filePath),
        ...?data,
      });

      final response = await _dioClient.client.post(
        endpoint,
        data: formData,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
      return _processResponse(response);
    } catch (e) {
      throw ApiException.handleError(e);
    }
  }

  dynamic _processResponse(Response response) {
    if (response.data == null) return null;

    // If response is already parsed as Map, return it
    if (response.data is Map<String, dynamic>) {
      return response.data;
    }

    // If response is a List, return it directly
    if (response.data is List) {
      return response.data;
    }

    // Otherwise return raw data
    return response.data;
  }

  /// Cancel all pending requests (useful for cleanup)
  void cancelAllRequests() {
    _dioClient.client.close(force: true);
  }
}
