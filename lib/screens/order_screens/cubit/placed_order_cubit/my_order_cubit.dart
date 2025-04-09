import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/order_screens/model/orders_model.dart';
import 'package:rika_ecomm_app/screens/order_screens/service/placed_order_services.dart';

class MyOrderCubit extends Cubit<Result<Order>> {
  CancelToken? cancelToken;
  final PlacedOrderServices _placedOrderServices;

  MyOrderCubit(this._placedOrderServices)
      : super(Result(isLoading: true)) {
    cancelToken ??= CancelToken();
    getOderList(cancelToken: cancelToken);
  }

  Future<void> getOderList({CancelToken? cancelToken}) async {
    try {
      emit(Result(isLoading: true));
      final orderList =
          await _placedOrderServices.getPlacedOrder(token: cancelToken);
      emit(Result(data: orderList));
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
