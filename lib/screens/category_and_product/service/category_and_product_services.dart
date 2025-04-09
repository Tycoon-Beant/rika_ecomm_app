import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/common_response.dart';
import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
import 'package:rika_ecomm_app/screens/category_and_product/model/category_model.dart';
import 'package:rika_ecomm_app/screens/filter/model/filter_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';

class CategoryAndProductServices {
  CategoryAndProductServices();

  Future<CategoriModel> getCategories({CancelToken? token}) async {
    final response = await DioSingleton()
        .dio
        .get("ecommerce/categories", cancelToken: token);
    final body = response.data;
    final categori = CategoriModel.fromJson(body);
    return categori;
  }

  Future<PaginationResponse<Product>> getProduct(
      {CancelToken? token, int? page}) async {
    final response = await DioSingleton().dio.get(
      "ecommerce/products",
      cancelToken: token,
      queryParameters: {"page": page ?? 1},
    );
    final body = response.data;
    final List<dynamic> jsonResponse =
        body["data"]["products"]; //response["data"]

    return PaginationResponse(
      page: page ?? 1,
      totalPages: body["data"]["totalPages"],
      data: jsonResponse.map((e) => Product.fromJson(e)).toList(),
    );
  }

  Future<PaginationResponse<Product>> filterProducts(
      {required FilterModel filter,
      CancelToken? token,
      int? page}) async {
    try {
      final response = await DioSingleton().dio.get(
          "ecommerce/products/filterProducts",
          cancelToken: token,
          queryParameters: {
            "minPrice": filter.min,
            "maxPrice": filter.max,
            "categoryId": filter.categoryId,
            "sort" : filter.sort,
            "page": page ?? 1,
          });
      final body = response.data;
      final List<dynamic> jsonResponse = body['data'];
      return PaginationResponse(
        page: page ?? 1,
        totalPages: body["meta"]["total"],
          data: jsonResponse.map((e) => Product.fromJson(e)).toList());
    } on DioException catch (e) {
      print("Error: $e");
      throw DioExceptions.fromDioError(e);
    }
  }

  Future<List<Product>> getProductByCategory(
      {required String categoryId, CancelToken? token}) async {
    try {
      final response = await DioSingleton().dio.get(
            "ecommerce/products/category/$categoryId",
            cancelToken: token,
          );
      final body = response.data;
      final List<dynamic> jsonResponse = body["data"]["products"];
      return jsonResponse.map((e) => Product.fromJson(e)).toList();
    } on DioException catch (e) {
      print("Error getting products by category : $e");
      throw DioExceptions.fromDioError(e);
    }
  }

  Future<Product> getProductById(
      {required String productId, CancelToken? token}) async {
    try {
      final response = await DioSingleton().dio.get(
            "ecommerce/products/$productId",
            cancelToken: token,
          );
      final body = response.data;
      final jsonResponse = Product.fromJson(body["data"]);
      return jsonResponse;
    } on DioException catch (e) {
      print("Error getting products by category : $e");
      throw DioExceptions.fromDioError(e);
    }
  }
}
