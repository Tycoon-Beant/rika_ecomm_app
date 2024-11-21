import 'package:bloc/bloc.dart';

import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/model/user_cart_model.dart';

import '../../services/cart_services.dart';

class CartListCubit extends Cubit<Result<UserCart>> {
   final CartServices _cartServices;

  CartListCubit(this._cartServices) : super(Result(isLoading: false)) {
    getCart();
  }

  Future<void> getCart() async {
    try {
      emit(Result(isLoading: true));
      final cartDetail = await _cartServices.getUserCart();
      emit(Result(data: cartDetail));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  void updateCart(UserCart cart) {
    emit(Result(data: cart));
  }
}
