import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';

class OngoingOrders extends StatefulWidget {
  const OngoingOrders({super.key});

  @override
  State<OngoingOrders> createState() => _OngoingOrdersState();
}

class _OngoingOrdersState extends State<OngoingOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset("assets/images/3x/orderitem1.png",fit: BoxFit.fill,),
                  const SizedBox(width: 8),
                  Expanded(flex: 5,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Roller Rabbit',style: context.theme.titleMedium),
                        Text('Vado Odelle Dress',style: context.theme.bodyMedium!.copyWith(color: Colors.grey)),
                        Text('Quantity: 1',style:  context.theme.bodyMedium!.copyWith(color: Colors.grey)),
                        Text('Size: L',style:  context.theme.bodyMedium!.copyWith(color: Colors.grey)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text('\$198.00',style: context.theme.titleSmall!.copyWith(fontFamily: FontFamily.w700))),
                ],
              ),
            ),
          ),
        //   Card(
        //     elevation: 5,
        //     color: Colors.white,
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Row(
        //         children: [
        //           Expanded(flex: 2,
        //             child: AspectRatio(
        //               aspectRatio: 1,
        //               child: Image.asset("assets/images/3x/orderitem2.png",fit: BoxFit.fill,)),
        //           ),
        //           const SizedBox(width: 8),
        //           Expanded(
        //             flex: 5,
        //             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text('Axel Arigato',style:  context.theme.titleMedium),
        //                 Text('Clean  sneakers',style:  context.theme.bodyMedium!.copyWith(color: Colors.grey)),
        //                 Text('Quantity: 1',style:  context.theme.bodyMedium!.copyWith(color: Colors.grey)),
        //                 Text('Size: 48',style:  context.theme.bodyMedium!.copyWith(color: Colors.grey)),
                    
        //               ],
        //             ),
        //           ),
                  
        //           Expanded(
        //             flex: 2,
        //             child: Text('\$245.00',style:context.theme.titleSmall!.copyWith(fontFamily: FontFamily.w700))),
        //         ],
        //       ),
        //     ),
        //   ),
        //   Container(
          
        //     color: Colors.white,
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Row(
        //          children: [
        //           AspectRatio(
        //             aspectRatio: 1,
        //             child: Image.asset("assets/images/3x/orderitem3.png",fit: BoxFit.fill,)),
        //           const SizedBox(width: 8),
        //           Column(crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text('Hershel Supply co',style: context.theme.titleMedium),
        //               Text('Daypack Bacpack',style:  context.theme.bodyMedium!.copyWith(color: Colors.grey)),
        //               Text('Quantity: 1',style:  context.theme.bodyMedium!.copyWith(color: Colors.grey)),
        //               Text('Size: m',style:  context.theme.bodyMedium!.copyWith(color: Colors.grey)),
                     
        //             ],
        //           ),
                  
        //           Text('\$40.00',style: context.theme.titleSmall!.copyWith(fontFamily: FontFamily.w700)),
        //         ],
        //       ),
        //     ),
        //   )
        ],
      ),
    );
  }
}