class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://sonic-zdi0.onrender.com/api';

  static const int connectTimeout = 15000; // 15 seconds for connection
  static const int receiveTimeout = 30000; // 30 seconds for receiving data
  static const int sendTimeout = 30000; // 30 seconds for sending data

  static const Map<String, String> headers = {};

  /// Toggle logging for Dio requests (useful for debugging). Set to false in production.
  static const bool enableLogging = true;

  /// Max redirects to follow (prevents infinite redirect loops)
  static const int maxRedirects = 5;

  /// Enable HTTP/2 for better performance (if server supports it)
  static const bool enableHttp2 = true;
}
