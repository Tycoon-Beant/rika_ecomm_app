import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/user_model.dart';
import 'package:rika_ecomm_app/services/signup_services.dart';

import '../../../model/result.dart';

class SignupCubit extends Cubit<Result<User>> {

  final Map<String, dynamic> _formData = {};

  SignupCubit() : super(Result(isLoading: false));

  Future<void> signup() async {
    try {
      emit(Result(isLoading: true));
      final signup = await SignupServices().postSignup(
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
