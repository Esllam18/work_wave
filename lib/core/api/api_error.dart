class ApiError {
  final String message;
  final int code;

  ApiError(this.message, this.code);

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(json['message'] ?? 'Unknown error', json['code'] ?? 500);
  }

  @override
  String toString() {
    return message;
  }
}
