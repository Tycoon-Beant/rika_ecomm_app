import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/my_profile_model.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/services/my_profile_services.dart';


class ProfileCubit extends Cubit<Result<MyProfile>> {
  final Map<String, dynamic> _formData = {};
 final MyProfileServices _myProfileServices;
  ProfileCubit(this._myProfileServices, ) : super(Result(isLoading: false));

Future<void> patchProfileData() async {
    try {
      emit(Result(isLoading: true));
      final addressDetailPatch = await _myProfileServices.patchProfileDetails(
       data: _formData
      );
      emit(Result(data: addressDetailPatch));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  void updateForm(String key, dynamic value) {
    _formData[key] = value;
  }

}
