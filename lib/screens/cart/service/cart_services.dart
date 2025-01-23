import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';


class CartServices {
//GET -->CART DETAILS --> LIST<ITEM> items
  Future<UserCart> getUserCart({CancelToken? token}) async {
    final response = await DioSingleton().dio.get("ecommerce/cart", cancelToken: token);
    final body = response.data;
    final categori = UserCart.fromJson(body["data"]);
    return categori;
  }

//POST --> ADD ITEM IN CART
  Future<UserCart> postUserCart(
      {required String productId, required int quantity}) async {
    try {
      final response = await DioSingleton()
          .dio
          .post('ecommerce/cart/item/$productId', data: {"quantity": quantity});
      final body = response.data;
      return UserCart.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error adding item to cart: $e");
      throw DioExceptions.fromDioError(e);
    }
  }

//dELETE --> ITEM FROM CART
  Future<UserCart> delUserCart({required dynamic productId}) async {
    try {
      final response =
          await DioSingleton().dio.delete('ecommerce/cart/item/$productId');
      final body = response.data;
      return UserCart.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error deleting item to cart: $e");
      throw DioExceptions.fromDioError(e);
    }
  }

  Future<UserCart> clearCart() async {
    try {
      final response = await DioSingleton().dio.delete('ecommerce/cart/clear');
      final body = response.data;
      return UserCart.fromJson(body["data"]);
    } catch (e) {
      print("Error in clearing cart");
      rethrow;
    }
  }
}
// final bool success = body["success"];
//     final message = body["message"];
//     final jsonResponse = body["data"];
//     if(jsonResponse == null && !success) throw message ?? "Unable to process data from server";
//     final Map<String,dynamic> data = jsonResponse;
//     return UserCart.fromJson(data);