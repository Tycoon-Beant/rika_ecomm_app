import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantity1 = 1;
  int quantity2 = 1;
  int quantity3 = 1;
  late String price;

  void incrementCount1() {
    setState(() {
      quantity1++;
      // calculatePrice();
    });
  }

  void decrementCount1() {
    if (quantity1 > 1) {
      setState(() {
        quantity1--;
        // calculatePrice();
      });
    }
  }

  void incrementCount2() {
    setState(() {
      quantity2++;
      // calculatePrice();
    });
  }

  void decrementCount2() {
    if (quantity2 > 1) {
      setState(() {
        quantity2--;
        // calculatePrice();
      });
    }
  }

  void incrementCount3() {
    setState(() {
      quantity3++;
      // calculatePrice();
    });
  }

  void decrementCount3() {
    if (quantity3 > 1) {
      setState(() {
        quantity3--;
        // calculatePrice();
      });
    }
  }

  // void calculatePrice() {
  //   double initPrice = 245.00;
  //   double totalPrice = initPrice * quantity1;
  //   price = totalPrice.toStringAsFixed(2); // Formatting the price
  // }

  @override
  void initState() {
    super.initState();
    // calculatePrice(); // Initialize price
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Image.asset(
              'assets/images/arrow.png',
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: Image.asset(
                'assets/images/cart2.png',
                // scale: 0.1,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('My Cart', style: context.theme.headlineSmall),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white,
                  elevation: 5, // Adds a shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset('assets/images/girlimage.png'),
                        SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Roller Rabbit',
                                style: context.theme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text('Vado Odelle Dress',
                                  style: context.theme.bodySmall
                                      ?.copyWith(color: Color(0xff666666))),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                '\$198.00',
                                style: context.theme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(50)),
                              height: 30,
                              width: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                      onTap: decrementCount1,
                                      child: Icon(
                                        Icons.remove,
                                        size: 15,
                                      )),
                                  Text(
                                    '$quantity1',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: FontFamily.w400),
                                  ),
                                  InkWell(
                                    onTap: incrementCount1,
                                    child: Icon(
                                      Icons.add,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white,
                  elevation: 5, // Adds a shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset('assets/images/shoe2.png'),
                        SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Axel Arigato',
                                style: context.theme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text('Clean 90 Trible Snakers',
                                  style: context.theme.bodySmall
                                      ?.copyWith(color: Color(0xff666666))),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                '\$245.00',
                                style: context.theme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(50)),
                              height: 30,
                              width: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                      onTap: decrementCount2,
                                      child: Icon(
                                        Icons.remove,
                                        size: 15,
                                      )),
                                  Text(
                                    '$quantity2',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: FontFamily.w400),
                                  ),
                                  InkWell(
                                    onTap: incrementCount2,
                                    child: Icon(
                                      Icons.add,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white,
                  elevation: 5, // Adds a shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset('assets/images/girlimage.png'),
                        SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Herschel Supply Co.',
                                style: context.theme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text('Daypack Backpack',
                                  style: context.theme.bodySmall
                                      ?.copyWith(color: Color(0xff666666))),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                '\$40.00',
                                style: context.theme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(50)),
                              height: 30,
                              width: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                      onTap: decrementCount3,
                                      child: Icon(
                                        Icons.remove,
                                        size: 15,
                                      )),
                                  Text(
                                    '$quantity3',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: FontFamily.w400),
                                  ),
                                  InkWell(
                                    onTap: incrementCount3,
                                    child: Icon(
                                      Icons.add,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Promo Code',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontSize: 15, color: Color(0xffAAAAAA)),
                            suffixIcon: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: () {
                                  // print('hi');
                                },
                                child: Text('Apply',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: FontFamily.w400)))),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  // width: 360,
                  // height: 143,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffEEEEEE),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal:',
                              style: context.theme.titleSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$483',
                              style: context.theme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          color: Color(0xffEEEEEE),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Shipping:',
                              style: context.theme.titleSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$17',
                              style: context.theme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          color: Color(0xffEEEEEE),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'BagTotal:',
                              style: context.theme.titleSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  '(3 item)',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 95, 95, 95),
                                      fontFamily: 'Mont Blanc Light'),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '\$500',
                                  style: context.theme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total (3 item) :',
                        style: context.theme.bodySmall,
                      ),
                      Text(
                        '\$500',
                        style: context.theme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text('Proceed to Checkout',
                                style: context.theme.titleSmall
                                    ?.copyWith(color: Colors.white)),
                          ),
                        ),
                        Image.asset('assets/images/arrow3.png')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
// class CounterState extends StatefulWidget {
//   const CounterState({super.key});

//   int firstcounter;
//   int secondcounter;
//   int thirdcounter;
//   @override
//   State<CounterState> createState() => _CounterStateState();
// }

// class _CounterStateState extends State<CounterState> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         GestureDetector(
//           onTap: ,
//         )
//       ],
//     );
//   }
// }
