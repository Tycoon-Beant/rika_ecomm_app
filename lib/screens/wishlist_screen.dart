import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image.asset('assets/images/arrow.png'),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('assets/images/bell.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 290,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Image.asset('assets/images/search.png'),
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Color(0xffAAAAAA)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade100))),
                      ),
                    ),
                    SizedBox(
                      width: 16.7,
                    ),
                    Image.asset('assets/images/scanner.png'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Whishlist',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                color: Colors.white,
                elevation: 5, // Adds a shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset('assets/images/girlimage.png'),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Roller Rabbit',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Vado Odelle Dress',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff666666),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '\$198.00',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                  child: Text(
                                'Add to cart',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/shoe2.png'),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Axel Arigato',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Clean 90 Trible Snakers',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xff666666),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '\$245.00',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                                child: Text(
                              'Add to cart',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/bag2.png'),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Herschel Supply Co.',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Daypack Backpack',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xff666666),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '\$40.00',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                                child: Text(
                              'Add to cart',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/shoe3.png'),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Soludos',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'lboza Classic Lace Sneakers',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xff666666),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '\$120.00',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                                child: Text(
                              'Add to cart',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/headphones.png'),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'On Ear Headphone',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Beats Solo3 Wireless Kulak',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xff666666),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '\$50.00',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 28,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                                child: Text(
                              'Add to cart',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
