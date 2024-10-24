import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';

class Screener extends StatefulWidget {
  const Screener({super.key});

  @override
  State<Screener> createState() => _ScreenerState();
}

class _ScreenerState extends State<Screener> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/3x/screenimg.png",width: 500,fit: BoxFit.cover,),
          Positioned(top: 180,left: 88,
            child:Image.asset("assets/images/3x/screener.png") ),
             Positioned(
              top: 10,
              left: 20,
              child: Image.asset("assets/images/arrowback.png")),
              Positioned(
              top: 10,
              right: 20,
              child: Image.asset("assets/images/more.png")),
          Positioned(top: 600,left: 60,
            child: 
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            height: 80,width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset("assets/images/3x/screentshirt.png"),
                  const SizedBox(width: 10),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 10),
                      const Text("SUNDRY" , style: TextStyle(
                        fontSize: 18,
                      ),),
                      Text("Racerback Dress", style: TextStyle(fontSize: 16,fontFamily: FontFamily.w700),)
                    ],
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: (){}, 
                  child: const Center(child: Text("+",
                  style: TextStyle(fontSize: 30, color: Colors.white),))
                   )
                ],
              ),
            ),
          )
          )
        ],
      ),
    );
  }
}