import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantity = 1;
  late String price;

  void incrementCount() {
    setState(() {
      quantity++;
      calculatePrice();
    });
  }

  void decrementCount() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        calculatePrice();
      });
    }
  }

  void calculatePrice() {
    double initPrice = 245.00;
    double totalPrice = initPrice * quantity;
    price = totalPrice.toStringAsFixed(2); // Formatting the price
  }

  @override
  void initState() {
    super.initState();
    calculatePrice(); // Initialize price
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          leading: Image.asset(
            'assets/images/arrow.png',
          ),
          actions: [
            Image.asset(
              'assets/images/cart2.png',
              scale: 0.1,
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Cart',
                  style: TextStyle(fontSize: 28, fontFamily: FontFamily.w700),
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
                                'Roller Rabbit',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: FontFamily.w700),
                              ),
                              Text(
                                'Vado Odelle Dress',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff666666),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                '\$198.00',
                                style: TextStyle(
                                    fontSize: 18, fontFamily: FontFamily.w700),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(50)),
                          height: 40,
                          width: 86,
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                child: TextButton(
                                  onPressed: decrementCount,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontFamily: FontFamily.w400),
                                  ),
                                ),
                              ),
                              Text(
                                '$quantity',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: FontFamily.w400),
                              ),
                              Container(
                                width: 40,
                                child: TextButton(
                                    onPressed: incrementCount,
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontFamily: FontFamily.w400),
                                    )),
                              )
                            ],
                          ),
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
                                style: TextStyle(
                                    fontSize: 20, fontFamily: FontFamily.w700),
                              ),
                              Text(
                                'Clean 90 Trible Snakers',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff666666),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                '\$245.00',
                                style: TextStyle(
                                    fontSize: 18, fontFamily: FontFamily.w700),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(50)),
                              height: 40,
                              width: 86,
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    child: TextButton(
                                      onPressed: decrementCount,
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: FontFamily.w400),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '$quantity',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontFamily: FontFamily.w400),
                                  ),
                                  Container(
                                    width: 40,
                                    child: TextButton(
                                        onPressed: incrementCount,
                                        child: Text(
                                          "+",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontFamily: FontFamily.w400),
                                        )),
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
                                style: TextStyle(
                                    fontSize: 20, fontFamily: FontFamily.w700),
                              ),
                              Text(
                                'Daypack Backpack',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff666666),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                '\$40.00',
                                style: TextStyle(
                                    fontSize: 18, fontFamily: FontFamily.w700),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(50)),
                              height: 40,
                              width: 86,
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    child: TextButton(
                                      onPressed: decrementCount,
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: FontFamily.w400),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '$quantity',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontFamily: FontFamily.w400),
                                  ),
                                  Container(
                                    width: 40,
                                    child: TextButton(
                                        onPressed: incrementCount,
                                        child: Text(
                                          "+",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontFamily: FontFamily.w400),
                                        )),
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
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Promo Code',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontSize: 16, color: Color(0xffAAAAAA)),
                            suffixIcon: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide.none,
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                                onPressed: () {
                                  // print('hi');
                                },
                                child: Text('Apply',
                                    style: TextStyle(
                                        fontSize: 18,
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
                    border: Border.all(color:const Color.fromARGB(255, 207, 206, 206),),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
                              style: TextStyle(
                                  fontSize: 18, fontFamily: FontFamily.w700),
                            ),
                            Text(
                              '\$483',
                              style: TextStyle(
                                  fontSize: 18, fontFamily: FontFamily.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 2,
                          color: const Color.fromARGB(255, 207, 206, 206),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Shipping:',
                              style: TextStyle(
                                  fontSize: 20, fontFamily: FontFamily.w700),
                            ),
                            Text(
                              '\$17',
                              style: TextStyle(
                                  fontSize: 20, fontFamily: FontFamily.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 2,
                          color: const Color.fromARGB(255, 207, 206, 206),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'BagTotal:',
                              style: TextStyle(
                                  fontSize: 20, fontFamily: FontFamily.w700),
                            ),
                            Row(
                              children: [
                                Text(
                                  '(3 item)',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 95, 95, 95),
                                      fontFamily: 'Mont Blanc Light'),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '\$500',
                                  style: TextStyle(
                                      fontSize:20, fontFamily: FontFamily.w700),
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
                Container(
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total (3 item) :',
                        style: TextStyle(
                            fontSize:20, fontFamily: FontFamily.w400,
                            color: Color(0xff666666),
                            ),
                      ),
                      Text('\$500',style: TextStyle(
                            fontSize:20, fontFamily: FontFamily.w400,
                            color: Color(0xff666666),
                            ), ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Text(
                            'Proceed to Checkout',
                            style: TextStyle(color: Colors.white),
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
