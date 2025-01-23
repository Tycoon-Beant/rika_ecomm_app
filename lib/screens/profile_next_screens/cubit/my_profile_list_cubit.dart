import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/model/my_profile_model.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/service/my_profile_services.dart';

import '../../../../../model/result.dart';


class MyProfileListCubit extends Cubit<Result<MyProfile>> {
  CancelToken? cancelToken;
  final MyProfileServices _myprofileServices;
  MyProfileListCubit(this._myprofileServices) : super(Result(isLoading: true)){
    cancelToken ??= CancelToken();
    getProfile();
  }

  Future<void> getProfile () async{
    try {
      emit(Result(isLoading: true));
      final profileDetail = await _myprofileServices.getMyProfile(token: cancelToken);
      emit(Result(data: profileDetail));
    } catch (e) {
      emit(Result(error: e));
    } 
  }

   @override
  Future<void> close() {
    cancelToken?.cancel();
    return super.close();
  }

}
