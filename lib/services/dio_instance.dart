import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioSingleton {
  static final DioSingleton _instance = DioSingleton._internal();
  
  late Dio dio;

  DioSingleton._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final prefs = await SharedPreferences.getInstance();
        final localStorage = LocalStorageService(prefs);
        if (!_publicEndpoints
            .any((endpoint) => options.path.contains(endpoint))) {
          final token = await localStorage.getToken();
          if (token != null) options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    ));
    dio.interceptors.add(LogInterceptor());
  }

  factory DioSingleton() {
    return _instance;
  }
}

final List<String> _publicEndpoints = [
  "users/login",
  "users/register",
];
