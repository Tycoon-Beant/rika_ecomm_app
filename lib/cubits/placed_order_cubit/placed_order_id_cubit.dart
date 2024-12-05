import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/model/order_detail_model.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/services/order_by_id_services.dart';

class PlacedOrderIdCubit extends Cubit<Result<OderDetail>> {
  final OrderByIdServices _orderByIdServices;
  PlacedOrderIdCubit( this._orderByIdServices)
      : super(Result(isLoading: false));

  Future<void> getOrderId({required String orderId}) async {
    try {
      emit(Result(isLoading: true));
      final orders = await _orderByIdServices.getOrderById(orderId: orderId);
      emit(Result(data: orders));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }
}
