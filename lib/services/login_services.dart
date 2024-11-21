import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/login_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

class LoginServices {

  final LocalStorageService _localStorageService;
  LoginServices(this._localStorageService);

  Future<Loginuser> postLogin(
      {required String username,
      required String password}) async {
    try {
      final response = await DioSingleton().dio.post('users/login', data: {
        "password": password,
        "username": username
      });
      final body = response.data;
      final token = body["accessToken"];
      await _localStorageService.saveToken(token);
      return Loginuser.fromJson(body["data"]);
    } on DioException catch (e) {
      print("login error: $e");
      throw DioExceptions.fromDioError(e);
    }
  }
}