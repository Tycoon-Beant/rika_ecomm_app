import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/orders_model.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/services/placed_order_services.dart';

class PlacedOrderCubit extends Cubit<Result<Order>> {
  final PlacedOrderServices _placedOrderServices;
  PlacedOrderCubit(this._placedOrderServices) : super(Result(isLoading: false));

  Future<void> postplaceOderCubit(
      {required String addressId}) async {
    try {
      emit(Result(isLoading: true));
      final order = await _placedOrderServices.postPlaceOrder(
          addressId: addressId);
      emit(Result(data: order));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

}
