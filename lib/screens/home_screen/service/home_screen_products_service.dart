import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';

class HomeScreenProductsService {
  Future<List<Product>> getProducts() async {
    try {
      final response = await DioSingleton().dio.get("ecommerce/products");
      final body = response.data;
      List<dynamic> jsonResponse = body['data']['products'];
      return jsonResponse.map((e) => Product.fromJson(e)).toList();
    } on DioException catch (e) {
      print("Error: $e");
      rethrow;
    }
  }
}
