import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
import 'package:rika_ecomm_app/screens/category_and_product/service/category_and_product_services.dart';


class ProductByIdCubit extends Cubit<Result<List<Product>>> {
  CancelToken? cancelToken;
  final CategoryAndProductServices _categoryServices;
  ProductByIdCubit(this._categoryServices) : super(Result(isLoading: false)){
    cancelToken ??= CancelToken();
  }

  Future<void> getProductById(List<String> productIds) async {
    try {
      emit(Result(isLoading: true, data: state.data));
      final productList = await Future.wait(productIds.map((e) => _categoryServices.getProductById(productId: e, token :cancelToken)));
      emit(Result(data:  productList));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    cancelToken?.cancel();
    return super.close();
  }
}
