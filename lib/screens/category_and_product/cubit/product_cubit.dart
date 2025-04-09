import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rika_ecomm_app/model/common_response.dart';
import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
import 'package:rika_ecomm_app/screens/filter/model/filter_model.dart';
import '../../../../../model/result.dart';
import '../service/category_and_product_services.dart';

class ProductCubit extends Cubit<Result<ProductListState>> {
  CancelToken? cancelToken;
  final CategoryAndProductServices _categoryServices;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  ProductCubit(this._categoryServices) : super(Result(isLoading: false)) {
    cancelToken ??= CancelToken();
    getProductDetail();
  }

  Future<void> getProductDetail() async {
    try {
      emit(Result(isLoading: true));

      final productDetail =
          await _categoryServices.getProduct(token: cancelToken);
      refreshController.loadComplete();
      emit(Result(data: ProductListState(products: productDetail)));
    } catch (e) {
      refreshController.loadFailed();
      emit(Result(error: e));
    }
  }

  Future<void> getfilteredProducts(FilterModel filter) async {
    try {
      emit(Result(isLoading: true));
      final response = await _categoryServices.filterProducts(filter: filter);
      refreshController.loadComplete();
      emit(Result(data: ProductListState(products: response)));
    } catch (e) {
      refreshController.loadFailed();
      emit(Result(error: e.toString()));
    }
  }

  Future<void> loadMore(FilterModel filter) async {
    try {
      final PaginationResponse<Product>? prevState = state.data?.products;

      if (prevState != null && prevState.hasNextPage) {
        final page = prevState.page + 1;
        PaginationResponse<Product>? productList;
        if (!filter.isClear) {
          productList = await _categoryServices.filterProducts(
              filter: filter, page: page);
        } else {
          productList = await _categoryServices.getProduct(
              token: cancelToken, page: page);
        }
        final list = [...prevState.data, ...productList.data];
        refreshController.loadComplete();
        final nextState = productList.copyWith(data: list);
        emit(Result(data: ProductListState(products: nextState)));
      } else {
        refreshController.loadNoData();
      }
    } catch (e) {
      refreshController.loadFailed();
    }
  }

  Future<void> getProductByCategoryId(String categoryId) async {
    try {
      emit(Result(isLoading: true, data: state.data));
      final categoryById = await _categoryServices.getProductByCategory(
          categoryId: categoryId, token: cancelToken);
      emit(Result(data: state.data?.copyWith(categoryProducts: categoryById)));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    cancelToken?.cancel();
    refreshController.dispose();
    return super.close();
  }
}

class ProductListState {
  PaginationResponse<Product>? products;
  List<Product>? categoryProducts;

  ProductListState({this.products, this.categoryProducts});

  ProductListState copyWith({
    PaginationResponse<Product>? products,
    List<Product>? categoryProducts,
  }) {
    return ProductListState(
      products: products ?? this.products,
      categoryProducts: categoryProducts ?? this.categoryProducts,
    );
  }
}
