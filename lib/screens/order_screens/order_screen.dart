import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/routes/routes.dart';
import 'package:rika_ecomm_app/screens/Widgets/async_widget.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/placed_order_cubit/my_order_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/placed_order_cubit/post_placed_order_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/model/orders_model.dart';
import 'package:rika_ecomm_app/screens/order_screens/tracking_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
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
            AsyncWidget<MyOrderCubit, Order>(
              data: (order) {
                return OrderItem(orders: order?.orders ?? []);
              },
            ),
          ],
        ),
      ),
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
                 Navigator.of(context).pushNamed(NavRoutes.traking.path, arguments: order);
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
                        Text("Order Id: ${order.id!}", style: context.theme.titleMedium),
                        Text('Discount price: \$ ${order.discountedOrderPrice.toString()}',
                            style: context.theme.bodyMedium!
                                .copyWith(color: context.colorScheme.secondary)),
                        Text("Order Price: \$ ${order.orderPrice.toString()}",
                            style: context.theme.bodySmall!
                                .copyWith(color: context.colorScheme.secondary)),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(order.status!,
                              style: context.theme.bodyMedium!
                                  .copyWith(color: Colors.grey, fontFamily: FontFamily.w800)),
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
