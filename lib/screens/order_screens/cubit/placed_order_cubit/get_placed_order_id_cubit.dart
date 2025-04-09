import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/order_screens/model/order_detail_model.dart';
import 'package:rika_ecomm_app/screens/order_screens/service/get_order_by_id_services.dart';

class GetPlacedOrderIdCubit extends Cubit<Result<OderDetail>> {
  final GetOrderByIdServices _orderByIdServices;
  CancelToken? cancelToken;
  GetPlacedOrderIdCubit(this._orderByIdServices) : super(Result(isLoading: false)) {
    cancelToken ??= CancelToken();
  }

  Future<void> getOrderId({required String orderId}) async {
    try {
      emit(Result(isLoading: true));
      final orders = await _orderByIdServices.getOrderById(orderId: orderId, token: cancelToken);
      emit(Result(data: orders));
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
