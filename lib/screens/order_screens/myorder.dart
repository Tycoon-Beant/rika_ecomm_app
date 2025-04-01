import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/Widgets/async_widget.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/placed_order_cubit/my_order_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/placed_order_cubit/post_placed_order_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/model/orders_model.dart';
import 'package:rika_ecomm_app/screens/order_screens/service/placed_order_services.dart';
import 'package:rika_ecomm_app/screens/order_screens/trakingaddress.dart';

class Myorder extends StatefulWidget {
  const Myorder({super.key});

  @override
  State<Myorder> createState() => _MyorderState();
}

class _MyorderState extends State<Myorder> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyOrderCubit(context.read<PlacedOrderServices>()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            leading: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Image.asset("assets/images/arrowback.png")),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('MyOrder', style: context.theme.headlineSmall),
                ),
                const SizedBox(height: 10),
                MultiBlocListener(
                  listeners: [
                    BlocListener<PostPlacedOrderCubit, Result<Order>>(
                      listener: (context, state) {
                        if (state.data?.orders != null) {
                          context.read<MyOrderCubit>().getOderList();
                        }
                        if (state.error != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.error.toString()),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                  child: AsyncWidget<MyOrderCubit, Order>(
                    data: (order) {
                      return OrderItem(orders: order?.orders ?? []);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.orders,
  });
  final List<Orders> orders;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          final order = orders[index];
          return Column(
            children: [
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Trakingaddress(
                            orders: order,
                          )));
                },
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onTertiary,
                    border: Border.all(color: context.colorScheme.onTertiary),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Order Id: ${order.id!}",
                            style: context.theme.titleMedium),
                        Text(
                            'Discount price: \$ ${order.discountedOrderPrice.toString()}',
                            style: context.theme.bodyMedium!.copyWith(
                                color: context.colorScheme.secondary)),
                        Text("Order Price: \$ ${order.orderPrice.toString()}",
                            style: context.theme.bodySmall!.copyWith(
                                color: context.colorScheme.secondary)),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(order.status!,
                              style: context.theme.bodyMedium!.copyWith(
                                  color: Colors.grey,
                                  fontFamily: FontFamily.w800)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
