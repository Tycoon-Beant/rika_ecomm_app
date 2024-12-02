import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';


class PaymentConfirmScreen extends StatefulWidget {
  const PaymentConfirmScreen({super.key});

  @override
  State<PaymentConfirmScreen> createState() => _PaymentConfirmScreenState();
}

class _PaymentConfirmScreenState extends State<PaymentConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Image.asset('assets/images/arrow.png')),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Payment',
                    style: TextStyle(fontFamily: FontFamily.w700, fontSize: 32),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 400,
                child: Image.asset('assets/images/card.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Card Details',
                    style: TextStyle(fontFamily : FontFamily.w700, fontSize: 24),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Card number',
                  hintStyle: TextStyle(color: Color(0xff888888), fontSize: 15),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade100,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Exp date',
                  hintStyle: TextStyle(color: Color(0xff888888), fontSize: 15),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade100,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'CVV',
                  hintStyle: TextStyle(color: Color(0xff888888), fontSize: 15),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade100,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily :FontFamily.w700,
                        color: Color(0xffAAAAAA)),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      // onPressed: () => Navigator.push(
                      //     context,
                      // MaterialPageRoute(
                      //     builder: (context) => const Succesfulscreen())),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                backgroundColor: Colors.white,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                        "assets/images/successicon.png"),
                                    Text(
                                      "Successfull",
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "You have successfully your shopping cart list!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "continue Shopping",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ))
                                  ],
                                ));
                          },
                        );
                      },
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: FontFamily.w700,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
