import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/my_profile_model.dart';
import 'package:rika_ecomm_app/services/my_profile_services.dart';

import '../../../model/result.dart';


class MyProfileListCubit extends Cubit<Result<MyProfile>> {
  final MyProfileServices _myprofileServices;
  MyProfileListCubit(this._myprofileServices) : super(Result(isLoading: true)){
    getProfile();
  }

  Future<void> getProfile () async{
    try {
      emit(Result(isLoading: true));
      final profileDetail = await _myprofileServices.getMyProfile();
      emit(Result(data: profileDetail));
    } catch (e) {
      emit(Result(error: e));
    } 
  }
}
