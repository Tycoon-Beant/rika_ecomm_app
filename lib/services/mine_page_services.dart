import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/models/product_model.dart';

class MinePageServices {
  final Dio _dio = Dio();

  MinePageServices() {
    _dio.options = BaseOptions(
      baseUrl: "https://fakestoreapi.com/",
      connectTimeout: Duration(minutes: 1),
      receiveTimeout: Duration(minutes: 1),
      sendTimeout: Duration(minutes: 1),
    );
  }
  Future<List<Product>> getProductList() async {
    final response = await _dio.get("/products");
    final List<dynamic> body = response.data;
    final product = body.map((e) => Product.fromJson(e)).toList();
    return product;
  }
}
