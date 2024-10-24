import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/screens/payment_confirm_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

var _value = 1;

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 12),
          child: Image.asset('assets/images/arrow.png'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Payment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shadowColor: Colors.grey.shade100,
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/creditcard.png'),
                          SizedBox(width: 10),
                          Text('Credit Card'),
                        ],
                      ),
                      Radio(
                          value: 1,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });
                          })
                      // Icon(
                      //   Icons.radio_button_off_outlined,
                      //   size: 15,
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shadowColor: Colors.grey.shade100,
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/paypal.png'),
                          SizedBox(width: 10),
                          Text('Paypal'),
                        ],
                      ),
                      // Icon(
                      //   Icons.radio_button_off_outlined,
                      //   size: 15,
                      // ),
                      Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });
                          })
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shadowColor: Colors.grey.shade100,
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/visa.png'),
                          SizedBox(width: 10),
                          Text('Visa'),
                        ],
                      ),
                      // Icon(
                      //   Icons.radio_button_off_outlined,
                      //   size: 15,
                      // ),
                      Radio(
                          value: 3,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });
                          })
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shadowColor: Colors.grey.shade100,
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/google_pay.png'),
                          SizedBox(width: 10),
                          Text('Google Pay'),
                        ],
                      ),
                      // Icon(
                      //   Icons.radio_button_off_outlined,
                      //   size: 15,
                      // ),
                      Radio(
                          value: 4,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });
                          })
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentConfirmScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(8),
                            backgroundColor: Colors.white,
                            shape: CircleBorder(
                              side: BorderSide(color: Colors.grey.shade200),
                            )),
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 28, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Add Card',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'History',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
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
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Vado Odelle Dress',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff666666),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Image.asset('assets/images/send.png'),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          Text(
                            '\$198.00',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
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
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Clean 90 Trible Snakers',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff666666),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Image.asset('assets/images/send.png'),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                '\$245.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
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
              Card(
                color: Colors.white,
                elevation: 5, // Adds a shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
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
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Daypack Backpack',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff666666),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Image.asset('assets/images/send.png'),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                '\$40.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                              ),
                            ],
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
