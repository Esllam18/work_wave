import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:work_wave/core/consts/app_durations.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      // ignore: avoid_single_cascade_in_expression_statements
      dio!..options.connectTimeout = AppDurations.timeOut;
      // ignore: avoid_single_cascade_in_expression_statements
      dio!..options.receiveTimeout = AppDurations.timeOut;
      addDioHeaders();
      addInterceptor();
      return dio!;
    }
    return dio!;
  }

  static void addDioHeaders() async {
    dio!.options.headers = {};
  }

  static void addInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }
}
