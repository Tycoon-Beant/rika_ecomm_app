import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/screens/auth/model/login_model.dart';

import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

class AuthService {
  final LocalStorageService _localStorageService;
  AuthService(this._localStorageService);

  Future<Loginuser> postLogin({required String username, required String password}) async {
    try {
      final response = await DioSingleton()
          .dio
          .post('users/login', data: {"password": password, "username": username});
      final body = response.data;
      final token = body["data"]["accessToken"];
      await _localStorageService.saveToken(token);
      return Loginuser.fromJson(body["data"]);
    } on DioException catch (e) {
      throw DioExceptions.fromDioError(e);
    }
  }

  Future<User> postSignup(
      {required String username, required String email, required String password}) async {
    try {
      final response = await DioSingleton().dio.post('users/register',
          data: {"email": email, "password": password, "role": "USER", "username": username});
      final body = response.data;
      return User.fromJson(body["data"]);
    } on DioException catch (e) {
      throw DioExceptions.fromDioError(e);
    }
  }
}
