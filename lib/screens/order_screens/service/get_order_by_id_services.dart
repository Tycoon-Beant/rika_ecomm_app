import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/screens/order_screens/model/order_detail_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';

class GetOrderByIdServices {
  CancelToken? cancelToken;
  GetOrderByIdServices();

  Future<OderDetail> getOrderById({required String orderId, CancelToken? token}) async {
    try {
      final response = await DioSingleton().dio.get(
            "ecommerce/orders/$orderId",
            cancelToken: token,
          );
      final body = response.data;
      return OderDetail.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error getting order Detail: $e");
      throw DioExceptions.fromDioError(e);
    }
  }

   
}
