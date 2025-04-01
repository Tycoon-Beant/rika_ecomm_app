import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/screens/auth/model/login_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

class UpdateAvatarService {
  final LocalStorageService _localStorageService;
  UpdateAvatarService(this._localStorageService);

  Future<User> patchCameraImage({required File coverImage}) async {
    Map<String, dynamic> data = {};

    try {
      final image = await MultipartFile.fromFile(
        coverImage.path,
        filename: coverImage.path.split('/').last,
      );

      data["avatar"] = image;

      final response = await DioSingleton().dio.patch(
        "users/avatar",
        data: FormData.fromMap(data),
      );

      final body = response.data;
      final user = User.fromJson(body["data"]);
      _localStorageService.saveUser(user);
      return User.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error updating post: $e");
      throw DioExceptions.fromDioError(e);
    }
  }
}