import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/address_model.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/services/order_address_services.dart';


class OrderAddressCubit extends Cubit<Result<Addresses?>> {
  final OrderAddressServices _orderServices;
  OrderAddressCubit(this._orderServices) : super(Result(isLoading: false));

  
  Future<void> getAddressId(String addressId) async {
    try {
      emit(Result(isLoading: true));
      final orderAddress =
          await _orderServices.getAddressOrderScreen(addressId: addressId);
      emit(Result(data:orderAddress));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  void updateOrderAddress(Addresses? address) {
    emit(Result(data: address));
  }
}
