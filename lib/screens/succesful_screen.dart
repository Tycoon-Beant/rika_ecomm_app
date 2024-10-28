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
            const SizedBox(
              height: 120,
            ),
            Center(child: Image.asset("assets/images/tikicon.png")),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Successful!",
              style: context.theme.headlineSmall,
            ),
            Text(
              "You have successfully registered in our app and start working in it.",
              textAlign: TextAlign.center,
              style: context.theme.titleSmall!.copyWith(color: Colors.grey),
            ),
            const SizedBox(
              height: 350,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => BottomBar())),
                child: Text(
                  "Start Shopping",
                  style:
                      context.theme.titleMedium!.copyWith(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
