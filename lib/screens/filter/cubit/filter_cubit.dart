import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/screens/filter/model/filter_model.dart';

class FilterCubit extends Cubit<FilterModel> {
  FilterCubit() : super(FilterModel());

  void update(FilterModel Function(FilterModel fm) up) {
    emit(up(state));
  }

  void clear() {
    emit(FilterModel());
  }
}
