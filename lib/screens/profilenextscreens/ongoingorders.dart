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
                  SizedBox(height:100,width: 80, child: Image.asset("assets/images/3x/orderitem1.png",fit: BoxFit.fill,)),
                  const SizedBox(width: 8),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Roller Rabbit',style: TextStyle(fontSize: 20,fontFamily: FontFamily.w700),),
                      Text('Vado Odelle Dress',style: TextStyle(fontSize: 18,color: Colors.grey),),
                      Text('Quantity: 1',style: TextStyle(color: Colors.grey,fontSize: 18),),
                      Text('Size: L',style: TextStyle(color: Colors.grey,fontSize: 18),),
                      
                    ],
                  ),
                  const SizedBox(width: 32),
                  Text('\$198.00',style: TextStyle(fontSize: 20,fontFamily: FontFamily.w700),),
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
                  SizedBox(height:100,width: 80, child: Image.asset("assets/images/3x/orderitem2.png",fit: BoxFit.fill,)),
                  const SizedBox(width: 8),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Axel Arigato',style: TextStyle(fontSize: 20,fontFamily: FontFamily.w700),),
                      Text('Clean  sneakers',style: TextStyle(fontSize: 18,color: Colors.grey),),
                      Text('Quantity: 1',style: TextStyle(color: Colors.grey,fontSize: 18),),
                      Text('Size: 48',style: TextStyle(color: Colors.grey,fontSize: 18),),
                  
                    ],
                  ),
                  const SizedBox(width: 48),
                  Text('\$245.00',style: TextStyle(fontSize: 20,fontFamily: FontFamily.w700),),
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
                  SizedBox(height:100,width: 80, child: Image.asset("assets/images/3x/orderitem3.png",fit: BoxFit.fill,)),
                  const SizedBox(width: 8),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hershel Supply co',style: TextStyle(fontSize: 20,fontFamily: FontFamily.w700),),
                      Text('Daypack Bacpack',style: TextStyle(fontSize: 18,color: Colors.grey),),
                      Text('Quantity: 1',style: TextStyle(color: Colors.grey,fontSize: 18),),
                      Text('Size: m',style: TextStyle(color: Colors.grey,fontSize: 18),),
                     
                    ],
                  ),
                  const SizedBox(width: 28),
                  Text('\$40.00',style: TextStyle(fontSize: 20,fontFamily: FontFamily.w700),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}