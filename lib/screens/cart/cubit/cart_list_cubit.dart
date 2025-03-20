import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
import '../service/cart_services.dart';

class CartListCubit extends Cubit<Result<UserCart>> {
  final CartServices _cartServices;
  CancelToken? cancelToken;

  CartListCubit(this._cartServices) : super(Result(isLoading: false)) {
    cancelToken ??= CancelToken();
    getCart();
  }

  Future<void> getCart() async {
    try {
      emit(Result(isLoading: true));
      final cartDetail = await _cartServices.getUserCart(token: cancelToken);
      emit(Result(data: cartDetail));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  void updateCart(UserCart cart) {
    emit(Result(data: cart));
  }

  @override
  Future<void> close() {
    cancelToken?.cancel();
    return super.close();
  }
}
