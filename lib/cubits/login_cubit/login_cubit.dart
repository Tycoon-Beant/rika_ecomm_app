import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/login_model.dart';
import 'package:rika_ecomm_app/services/login_services.dart';

import '../../model/result.dart';


class LoginCubit extends Cubit<Result<Loginuser>> {

  final LoginServices _loginServices;
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
