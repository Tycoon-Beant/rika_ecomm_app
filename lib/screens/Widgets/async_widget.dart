import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/result.dart';
 
class AsyncWidget<C extends StateStreamable<Result<E>>, E> extends StatelessWidget {
  final Widget Function(E? data) data;
  const AsyncWidget({super.key, required this.data});
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, Result<E>>(builder: (context, state) {
      return state.when(
        onData: (state) => data(state),
        onLoading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        onError: (e) {
          return Text(e.toString());
        },
      );
    });
  }
}
 
 