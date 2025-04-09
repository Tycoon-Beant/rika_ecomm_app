import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
import 'package:rika_ecomm_app/screens/home_screen/service/home_screen_products_service.dart';

class HomeScreenProductsCubit extends Cubit<Result<List<Product>>> {
  HomeScreenProductsService homeScreenProductsService;
  HomeScreenProductsCubit(this.homeScreenProductsService)
      : super(Result(isLoading: false)) {
    getProducts();
  }

  Future<void> getProducts() async {
    try {
      emit(Result(isLoading: true));
      final response = await homeScreenProductsService.getProducts();
      emit(Result(data: response));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }
}
