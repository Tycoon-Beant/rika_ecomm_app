import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/bottonnav/bottom_nav_bar.dart';


class Succesfulscreen extends StatefulWidget {
  const Succesfulscreen({super.key});

  @override
  State<Succesfulscreen> createState() => _SuccesfulscreenState();
}

class _SuccesfulscreenState extends State<Succesfulscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
             
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
             const SizedBox(height: 120,),
           Center(child: Image.asset("assets/images/tikicon.png")),
           const SizedBox(height: 20,),
           Text("Successful!", style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontFamily: FontFamily.w700
           ),),

           const Text("You have successfully registered in our app and start working in it.",textAlign: TextAlign.center, 
           style: TextStyle(color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
           ),
           const SizedBox(height: 200,),
           ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomBar())),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                          child: Text(
                            "Start Shopping",
                            style: TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        )),
          ],
        ),
      ),
    );
  }
}