import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/screens/auth/model/login_model.dart';
import 'package:rika_ecomm_app/screens/auth/service/auth_service.dart';

import '../../../../../model/result.dart';

class LoginCubit extends Cubit<Result<Loginuser>> {
  final AuthService _loginServices;
  final Map<String, dynamic> _formData = {};

  LoginCubit(this._loginServices) : super(Result(isLoading: false));

  Future<void> login() async {
    try {
      emit(Result(isLoading: true));
      final login = await _loginServices.postLogin(
        username: _formData["username"],
        password: _formData["password"],
      );
      emit(Result(data: login));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  void updateForm(String key, dynamic value) {
    _formData[key] = value;
  }
}
