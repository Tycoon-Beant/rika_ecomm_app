import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/screens/address_screen/model/address_model.dart';

import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';

class GetOrderAddressIdService {
  GetOrderAddressIdService();

  Future<Addresses> getAddressOrderScreen({required String addressId, CancelToken? token}) async {
    try {
      final response = await DioSingleton().dio.get(
            'ecommerce/addresses/$addressId',
            cancelToken: token,
          );
      final body = response.data;
      return Addresses.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error getting address to order screen: $e");
      throw DioExceptions.fromDioError(e);
    }
  }
}
