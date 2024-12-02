import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/address_model.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/services/address_services.dart';

class AddressListCubit extends Cubit<Result<List<Addresses>>> {
  final AddressServices _addressServices;

  AddressListCubit(this._addressServices) : super(Result(isLoading: true)){
    getAddressList();
  }

  Future<void> getAddressList() async{
    try {
      emit(Result(isLoading: true));
      final addresslist = await _addressServices.getaddresses();
      emit(Result(data: addresslist));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }
  void updateAddress(List<Addresses> address) {
    emit(Result(data: address));
  }

  
}
