import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/filter_model.dart';

class FilterCubit extends Cubit<FilterModel> {
  FilterCubit() : super(FilterModel());

  void apply(FilterModel filter) {
    emit(filter);
  }

  void clear() {
    emit(FilterModel());
  }
}
