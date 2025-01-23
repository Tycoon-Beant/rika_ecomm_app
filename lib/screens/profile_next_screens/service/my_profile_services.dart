import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/model/my_profile_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';

class MyProfileServices {
  MyProfileServices();

  Future<MyProfile> getMyProfile({CancelToken? token}) async {
    final response = await DioSingleton().dio.get(
          "ecommerce/profile",
          cancelToken: token,
        );
    final body = response.data;
    final profile = MyProfile.fromJson(body["data"]);
    return profile;
  }

  Future<MyProfile> patchProfileDetails({Map<String, dynamic>? data}) async {
    try {
      final response = await DioSingleton().dio.patch(
            'ecommerce/profile',
            data: data,
          );
      final body = response.data;
      return MyProfile.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error patching profile: $e");
      throw DioExceptions.fromDioError(e);
    }
  }
}
