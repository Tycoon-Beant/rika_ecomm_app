import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/result.dart';

import '../../model/user_cart_model.dart';
import '../../services/cart_services.dart';

class CartCubit extends Cubit<Result<CartState>> {
  final CartServices _cartServices;

  CartCubit(this._cartServices) : super(Result(isLoading: false));

  Future<void> postCartItem(
      {required String productId, required int quantity}) async {
    try {
      emit(Result(isLoading: true));
      final cart = await _cartServices.postUserCart(
          productId: productId, quantity: quantity);
      emit(Result(data: CartState(event: CartEvent.add, cart: cart)));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  Future<void> deltCartItem({required String productId}) async {
    try {
      emit(Result(isLoading: true));
      final cart = await _cartServices.delUserCart(productId: productId);
      emit(Result(data: CartState(event: CartEvent.delete, cart: cart)));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  Future<void> updateQuantity(
      {required String productId, required int quantity}) async {
    try {
      emit(Result(isLoading: true));
      final cart = await _cartServices.postUserCart(
          productId: productId, quantity: quantity);
      emit(Result(data: CartState(event: CartEvent.update, cart: cart)));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  Future<void> clearCartTotally() async {
    try {
      emit(Result(isLoading: true));
      final cartDetail = await _cartServices.clearCart();
      emit(Result(data: CartState(event: CartEvent.clear, cart: cartDetail)));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }
}

class CartState {
  final CartEvent event;
  final UserCart cart;

  CartState({required this.event, required this.cart});
}

enum CartEvent { add, delete, update, clear }
