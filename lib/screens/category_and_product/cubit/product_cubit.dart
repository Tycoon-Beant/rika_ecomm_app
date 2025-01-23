import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
import '../../../../../model/result.dart';
import '../service/category_and_product_services.dart';

class ProductCubit extends Cubit<Result<ProductListState>> {
  CancelToken? cancelToken;
  final CategoryAndProductServices _categoryServices;
  ProductCubit(this._categoryServices) : super(Result(isLoading: false)) {
    cancelToken ??= CancelToken();
    getProductDetail();
  }

  Future<void> getProductDetail() async {
    try {
      emit(Result(isLoading: true));
      final productDetail = await _categoryServices.getProduct(token: cancelToken);
      emit(Result(data:
              ProductListState(products: productDetail)));
    } catch (e) {
      emit(Result(error: e));
    }
  }

  Future<void> getProductByCategoryId(String categoryId) async {
    try {
      emit(Result(isLoading: true, data: state.data));
      final categoryById =
          await _categoryServices.getProductByCategory(categoryId: categoryId, token: cancelToken);
      emit(Result(data: state.data?.copyWith(categoryList: categoryById)));
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

class ProductListState {
  List<Product>? products;
  List<Product>? categoryProducts;

  ProductListState({this.products, this.categoryProducts});

  ProductListState copyWith(
      {List<Product>? products, List<Product>? categoryList}) {
    return ProductListState(
        categoryProducts: categoryProducts ?? categoryList,
        products: this.products ?? products);
  }
}
