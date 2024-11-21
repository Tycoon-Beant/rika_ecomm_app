// import 'package:rika_ecomm_app/model/products.dart';

import 'package:flutter/material.dart';

class Result<T> {
  bool isLoading;
  T? data;
  Object? error;

  Result({this.isLoading = false, this.error, this.data});
}

extension ResultX<T> on Result<T> {
  Widget when({
    required Widget Function(T? data) onData,
    required Widget Function() onLoading,
    required Widget Function(Object? e) onError,
  }) {
    if(isLoading) {
      return onLoading(); 
    }
    if(error != null) {
      return onError(error);
    } 
    return onData(data);
  }
}
