import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/auth/model/login_model.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/service/update_avatar_service.dart';

class UpdateAvatarCubit extends Cubit<Result<User>> {
  final UpdateAvatarService _avatarService;
  UpdateAvatarCubit(this._avatarService) : super(Result(isLoading: false));


  Future<void> patchCoverImg({required File image,}) async{
    try {
      emit(Result(isLoading: true));
      final patchData = await _avatarService.patchCameraImage(coverImage:image);
      emit(Result(data: patchData));
    } catch (e) {
      emit(Result(error:e.toString()));
    }
  }

}
