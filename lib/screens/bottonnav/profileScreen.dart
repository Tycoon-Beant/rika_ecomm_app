import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/orderscreens/orderdetails.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/payment_method_screen.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/myorder.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/profiledetails.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/wishlist_screen.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  final List<Map<String, dynamic>> profile = [
    {
      "icon": "assets/images/3x/profiledetail.png",
      "title": "Profile Details",
      "page": ProfileDetails(),
    },
    {
      "icon" : "assets/images/3x/myorder.png",
      "title":"My Order",
      "page" : Myorder(),
    },
    {
      "icon" : "assets/images/3x/myfav.png",
      "title":"My Favorite",
      "page" : WishlistScreen(),
    },
    {
      "icon" : "assets/images/3x/shippingadd.png",
      "title":"Shipping Address",
      "page" : Orderdetails(),
    },
    {
      "icon" : "assets/images/3x/mycard.png",
      "title":"My Card",
      "page" : PaymentMethodScreen(),
    },
    {
      "icon" : "assets/images/3x/mysettiing.png",
      "title":"Settings",
      "page" : Myorder(),
    }
  ];
  
  
  
  final List <Map<String ,dynamic>> faq = [
    {
      "icon" : "assets/images/3x/faq.png",
      "title":"FAQ",
      "page" : Myorder(),
    },
    {
      "icon" : "assets/images/3x/privacy.png",
      "title":"Privacy Policy",
      "page" : Myorder(),
    },
    {
      "icon" : "assets/images/3x/community.png",
      "title":"Community",
      "page" : Myorder(),
    }
  ];
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        scrolledUnderElevation: 0.1,
        surfaceTintColor: Colors.white,
        leading: GestureDetector(
          child: Image.asset("assets/images/arrowback.png")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset("assets/images/settings.png",scale: 0.7,),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Card(
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Image.asset("assets/images/3x/profileimg.png"),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hasan Mahmud',
                            style: TextStyle(
                                fontSize: 20, fontFamily: FontFamily.w700),
                          ),
                          Text(
                            'rikafashionshop@gmail.com',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 173, 170, 170),
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      ...profile.map((e) => ProfileItem(title: e["title"], icon: e["icon"], page: e["page"])),
                      
                      
                     
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                    decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 173, 170, 170),
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Wrap(
                    children: [
                      ...faq.map((e)=> ProfileItem(title: e["title"], icon: e["icon"], page: e["page"])),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String icon;
  final Widget page;

  const ProfileItem(
      {super.key, required this.title, required this.icon, required this.page});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon),
        const SizedBox(width: 8),
        SizedBox(
            width: 200,
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        const SizedBox(width: 20),
        SizedBox(
          width: 20,
          child: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => page));
            },
            icon: Icon(Icons.arrow_forward_ios),
          ),
        )
      ],
    );
  }
}
