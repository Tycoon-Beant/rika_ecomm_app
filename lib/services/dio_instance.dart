import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/config/common.dart';

class DioSingleton {
  static final DioSingleton _instance = DioSingleton._internal();
  late Dio dio;

  DioSingleton._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl, 
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  factory DioSingleton() {
    return _instance;
  }
}
