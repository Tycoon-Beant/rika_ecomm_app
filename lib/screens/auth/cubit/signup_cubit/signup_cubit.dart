import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/screens/auth/model/login_model.dart';
import 'package:rika_ecomm_app/screens/auth/service/auth_service.dart';

import '../../../../../../model/result.dart';

class SignupCubit extends Cubit<Result<User>> {
  final AuthService _authService;

  final Map<String, dynamic> _formData = {};

  SignupCubit(this._authService) : super(Result(isLoading: false));

  Future<void> signup() async {
    try {
      emit(Result(isLoading: true));
      final signup = await _authService.postSignup(
        username: _formData["username"],
        email: _formData["email"],
        password: _formData["password"],
      );
      emit(Result(data: signup));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  void updateForm(String key, dynamic value) {
    _formData[key] = value;
  }
}
