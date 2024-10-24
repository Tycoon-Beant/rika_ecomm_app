import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/completedorders.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/ongoingorders.dart';

class Myorder extends StatefulWidget {
  const Myorder({super.key});

  @override
  State<Myorder> createState() => _MyorderState();
}

class _MyorderState extends State<Myorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset("assets/images/arrowback.png"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
              width: double.maxFinite,
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(child: Text('MyOrder',style: TextStyle(fontSize: 24,fontFamily: FontFamily.w800),)),
                      
                        ButtonsTabBar(
                          contentPadding: EdgeInsets.all(8),
                          backgroundColor: Colors.black,
                          unselectedBackgroundColor: Colors.white,
                          unselectedBorderColor: Colors.grey,
                          borderWidth: 2,
                          borderColor: Colors.black,
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: FontFamily.w700,
                          ),
                          unselectedLabelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontFamily: FontFamily.w700,
                          ),
                          // Add your tabs here
                          tabs: [
                            Tab(
                              text: "Ongoing",
                            ),
                            Tab(
                              text: "Completed",
                            )
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [OngoingOrders(), CompletedOrders()],
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
