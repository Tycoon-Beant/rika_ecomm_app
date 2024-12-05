import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/cubits/placed_order_cubit/placed_order_cubit.dart';
import 'package:rika_ecomm_app/cubits/placed_order_cubit/placed_order_id_cubit.dart';
import 'package:rika_ecomm_app/model/order_detail_model.dart';
import 'package:rika_ecomm_app/model/orders_model.dart';
import 'package:rika_ecomm_app/screens/Widgets/async_widget.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Trakingaddress extends StatefulWidget {
  const Trakingaddress({super.key, required this.orders});
  final Orders orders;

  @override
  State<Trakingaddress> createState() => _TrakingaddressState();
}

class _TrakingaddressState extends State<Trakingaddress> {
  @override
  void initState() {
    super.initState();
    context.read<PlacedOrderIdCubit>().getOrderId(orderId: widget.orders.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/3x/arrowback.png"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AsyncWidget<PlacedOrderIdCubit, OderDetail>(
            data: (order) {
              return OrderTrackingDetail(orders: order!);
            },
          ),
        ),
      ),
    );
  }
}

class OrderTrackingDetail extends StatelessWidget {
  const OrderTrackingDetail({
    super.key,
    required this.orders,
  });
  final OderDetail orders;
  @override
  Widget build(BuildContext context) {
    String lastFourOrderId = orders.id != null && orders.id!.length >= 4
        ? orders.id!.substring(orders.id!.length - 4)
        : orders.id ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Order Id: $lastFourOrderId',
            style: context.theme.titleLarge!
                .copyWith(fontFamily: FontFamily.w700)),
        Text(
            '${orders.order?.address?.city} - ' +
                '${orders.order?.address?.state}',
            style: context.theme.titleMedium!.copyWith(color: Colors.grey)),
        const SizedBox(height: 20),
        Container(
          height: 100,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 235, 233, 233),
                    blurRadius: 2,
                    spreadRadius: 3,
                    offset: Offset(0, 2))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      orders.order?.items?.first.product?.mainImage?.url ?? '',fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        orders.order?.items?.first.product?.name ?? "",
                        style: context.theme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Quantity: ${orders.order?.items?.first.quantity ?? 1 }",
                        style: context.theme.titleMedium!.copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      
                    ],
                  ),
                ),
                Text(
                        '\$ ${(orders.order?.items?.first.product?.price ?? 0) * (orders.order?.items?.first.quantity ?? 0)}',
                        style: context.theme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Text('Collection Point',
            style: context.theme.titleLarge!
                .copyWith(fontFamily: FontFamily.w700)),
        const SizedBox(height: 10),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('10:00-11:00 - 25 June,2021',
                    style:
                        context.theme.titleSmall!.copyWith(color: Colors.grey)),
                Text(
                    '${orders.order?.address?.addressLine1} '
                    "${orders.order?.address?.addressLine2}, "
                    "${orders.order?.address?.city},"
                    "${orders.order?.address?.state}",
                    maxLines: 2,
                    style:
                        context.theme.titleSmall!.copyWith(color: Colors.grey)),
              ],
            ),
            const SizedBox(width: 50),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 2,
          width: 400,
          color: const Color.fromARGB(255, 210, 209, 209),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('You can change pick-up time for',
                    style:
                        context.theme.titleSmall!.copyWith(color: Colors.grey)),
                Text('your order by 10:00, 24 June',
                    style:
                        context.theme.titleSmall!.copyWith(color: Colors.grey)),
              ],
            ),
            const SizedBox(width: 50),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text('Change',
                  style:
                      context.theme.titleSmall!.copyWith(color: Colors.white)),
            )
          ],
        ),
        const SizedBox(height: 20),
        TimlineHistory(),
      ],
    );
  }
}

class TimlineHistory extends StatelessWidget {
  const TimlineHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('History',
            style: context.theme.titleLarge!
                .copyWith(fontFamily: FontFamily.w700)),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.2,
          isFirst: true,
          indicatorStyle: IndicatorStyle(
            width: 10,
            color: Colors.black,
          ),
          beforeLineStyle: LineStyle(
            color: Colors.black,
            thickness: 2,
          ),
          afterLineStyle: LineStyle(
            color: Colors.black,
            thickness: 2,
          ),
          startChild: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('26 June ',
                    style: context.theme.titleMedium!
                        .copyWith(fontFamily: FontFamily.w700)),
                Text('11:00',
                    style:
                        context.theme.titleSmall!.copyWith(color: Colors.grey)),
              ],
            ),
          ),
          endChild: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Package have been received",
                    style: context.theme.titleMedium!
                        .copyWith(fontFamily: FontFamily.w700)),
                Text("Washington - Georgia",
                    style:
                        context.theme.titleSmall!.copyWith(color: Colors.grey)),
              ],
            ),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.2,
          indicatorStyle: IndicatorStyle(
            width: 10,
            color: Colors.black,
          ),
          beforeLineStyle: LineStyle(
            color: Colors.black,
            thickness: 2,
          ),
          afterLineStyle: LineStyle(
            color: Colors.black,
            thickness: 2,
          ),
          startChild: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('25 June ',
                    style: context.theme.titleMedium!
                        .copyWith(fontFamily: FontFamily.w700)),
                Text(
                  '20:30',
                  style: context.theme.titleSmall!.copyWith(color: Colors.grey),
                )
              ],
            ),
          ),
          endChild: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Arrived at destination area",
                    style: context.theme.titleMedium!
                        .copyWith(fontFamily: FontFamily.w700)),
                Text("End of tracking delivery tomorrow",
                    style:
                        context.theme.titleSmall!.copyWith(color: Colors.grey)),
              ],
            ),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.2,
          indicatorStyle: IndicatorStyle(
            width: 10,
            color: Colors.black,
          ),
          beforeLineStyle: LineStyle(
            color: Colors.black,
            thickness: 2,
          ),
          afterLineStyle: LineStyle(
            color: Colors.black,
            thickness: 2,
          ),
          startChild: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('24 June ',
                    style: context.theme.titleMedium!
                        .copyWith(fontFamily: FontFamily.w700)),
                Text('09:45',
                    style:
                        context.theme.titleSmall!.copyWith(color: Colors.grey)),
              ],
            ),
          ),
          endChild: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Accepted by GHL",
                    style: context.theme.titleMedium!
                        .copyWith(fontFamily: FontFamily.w700)),
                Text("Washington - Llinois",
                    style:
                        context.theme.titleSmall!.copyWith(color: Colors.grey)),
              ],
            ),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.2,
          isLast: true,
          indicatorStyle: IndicatorStyle(
            width: 10,
            color: Colors.black,
          ),
          beforeLineStyle: LineStyle(
            color: Colors.black,
            thickness: 2,
          ),
          afterLineStyle: LineStyle(
            color: Colors.black,
            thickness: 2,
          ),
          startChild: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('22 June ',
                    style: context.theme.titleMedium!
                        .copyWith(fontFamily: FontFamily.w700)),
                Text('13:05',
                    style:
                        context.theme.titleSmall!.copyWith(color: Colors.grey)),
              ],
            ),
          ),
          endChild: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Arrived at destination",
                    style: context.theme.titleMedium!
                        .copyWith(fontFamily: FontFamily.w700)),
                Text("Washington - Llinois",
                    style:
                        context.theme.titleSmall!.copyWith(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
