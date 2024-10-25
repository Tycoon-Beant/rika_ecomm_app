import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';

class CompletedOrders extends StatefulWidget {
  const CompletedOrders({super.key});

  @override
  State<CompletedOrders> createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
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
                  SizedBox(height:100,width: 80, child: Image.asset("assets/images/3x/orderitem4.png",fit: BoxFit.fill,)),
                  const SizedBox(width: 8),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Soludos',style:  context.theme.titleMedium),
                      Text('Ibiza Lace Sneakers',style: context.theme.bodyLarge!.copyWith(color: Colors.grey)),
                      Text('Quantity: 1',style:context.theme.bodyLarge!.copyWith(color: Colors.grey)),
                      Text('Size: 42',style: context.theme.bodyLarge!.copyWith(color: Colors.grey)),
                      
                    ],
                  ),
                  const SizedBox(width: 40),
                  Text('\$120.00',style:  context.theme.titleSmall!.copyWith(fontFamily: FontFamily.w700)),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(height:100,width: 80, child: Image.asset("assets/images/3x/orderitem5.png",fit: BoxFit.fill,)),
                  const SizedBox(width: 8),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('On Ear Headphone',style: context.theme.titleMedium),
                      Text('Beats Solo3 Wireless',style:context.theme.bodyLarge!.copyWith(color: Colors.grey)),
                      Text('Quantity: 1',style: context.theme.bodyLarge!.copyWith(color: Colors.grey)),
                      Text('Size: M',style: context.theme.bodyLarge!.copyWith(color: Colors.grey)),                  
                    ],
                  ),
                  const SizedBox(width: 36),
                  Text('\$50.00',style: context.theme.titleSmall!.copyWith(fontFamily: FontFamily.w700)),
                ],
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}