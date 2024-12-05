import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/orders_model.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/services/placed_order_services.dart';


class PlaceOrderListCubit extends Cubit<Result<Order>> {
  final PlacedOrderServices _placedOrderServices;
  PlaceOrderListCubit(this._placedOrderServices) : super(Result(isLoading: true)){
    getOderList();
  }

   Future<void> getOderList() async {
    try {
      emit(Result(isLoading: true));
      final orderList = await _placedOrderServices.getPlacedOrder();
      emit(Result(data: orderList));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

}
