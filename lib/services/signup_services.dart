import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/user_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';

class SignupServices {
  SignupServices();

  Future<User> postSignup(
      {required String username,
      required String email,
      required String password}) async {
    try {
      final response = await DioSingleton().dio.post('users/register', data: {
        "email": email,
        "password": password,
        "role": "USER",
        "username": username
      });
      final body = response.data;
      return User.fromJson(body["data"]);
    } on DioException catch (e) {
      print("signup error : $e");
      throw DioExceptions.fromDioError(e);
    }
  }
}
