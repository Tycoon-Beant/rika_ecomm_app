import 'package:dio/dio.dart';

class DioSingleton {
  static final DioSingleton _instance = DioSingleton._internal();
  late Dio dio;

  DioSingleton._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.29.143:8080/api/v1/", 
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
