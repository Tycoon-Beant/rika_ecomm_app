import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/screens/address_screen/model/address_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';

class AddressServices {

  AddressServices();

  Future<List<Addresses>> getaddresses({CancelToken? token}) async {
    final response = await DioSingleton().dio.get(
          'ecommerce/addresses',
          cancelToken: token,
        );
    final body = response.data;
    final List<dynamic> jsonResponse = body['data']['addresses'];
    return jsonResponse.map((e) => Addresses.fromJson(e)).toList();
  }

  Future<Addresses> postAddress({
    required String addressLine1,
    required String addressLine2,
    required String city,
    required String state,
    required String pincode,
    required String country,
  }) async {
    try {
      final response = await DioSingleton().dio.post(
        'ecommerce/addresses',
        data: {
          "addressLine1": addressLine1,
          "addressLine2": addressLine2,
          "city": city,
          "state": state,
          "pincode": pincode,
          "country": country
        },
      );
      final body = response.data;
      return Addresses.fromJson(body["data"]);
    } on DioException catch (e) {
      print("post addresss error : $e");
      throw DioExceptions.fromDioError(e);
    }
  }

  Future<Addresses> patchAddressDetails(
      {required String addressId,
      required String addressLine1,
      required String addressLine2,
      required String city,
      required String state,
      required String pincode,
      required String country}) async {
    try {
      final response = await DioSingleton().dio.patch(
        'ecommerce/addresses/$addressId',
        data: {
          "addressLine1": addressLine1,
          "addressLine2": addressLine2,
          "city": city,
          "state": state,
          "pincode": pincode,
          "country": country
        },
      );
      final body = response.data;
      return Addresses.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error patching address: $e");
      throw DioExceptions.fromDioError(e);
    }
  }

  Future<Addresses> deleteAddress({required String addressId}) async {
    try {
      final response = await DioSingleton().dio.delete(
            'ecommerce/addresses/$addressId',
          );
      final body = response.data;
      return Addresses.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error deleting address: $e");
      throw DioExceptions.fromDioError(e);
    }
  }
}
