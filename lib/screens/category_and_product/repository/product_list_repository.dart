// import 'package:dio/dio.dart';
// import 'package:rika_ecomm_app/model/common_response.dart';
// import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
// import 'package:rika_ecomm_app/screens/category_and_product/service/category_and_product_services.dart';

// class ProductListRepository {
//   PaginationResponse<Product>? _paginationResponse;
//   final CategoryAndProductServices _productServices;

//   ProductListRepository({required CategoryAndProductServices productService})
//       : _productServices = productService;

//   Future<PaginationResponse<Product>> productList(int page, {CancelToken? cancelToken}) async {
//     try {
//       final response =
//           await _productServices.getProduct(token: cancelToken, page: page);
//       if (response == null) {
//         throw Exception("Failed to fetch products: Response is null");        
//       }
//       return response;
//     } catch (e) {
//       throw Exception("Error fetching posts: $e");
//     }
//   }

//   Future<List<Product>> loadMore() async {
//     if (_paginationResponse == null || !_paginationResponse!.hasNextPage) {
//       return _paginationResponse?.data ?? [];
//     }

//     try {
//       final oldData = List.of(_paginationResponse!.data); // Clone existing data
//       final newPage = _paginationResponse!.page + 1;
//       final newResponse = await _productServices.getProduct(page: newPage);
//       oldData.addAll(newResponse.data);
//       _paginationResponse?.copyWith(data: oldData, page: newResponse.page);
//       return _paginationResponse!.data;
//     } catch (e) {
//       throw Exception("Error loading more posts: $e");
//     }
//   }
// }
