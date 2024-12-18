import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/login.dart';
import 'package:rika_ecomm_app/screens/signup.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({super.key});

  @override
  State<SplashScreenTwo> createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/3x/splash_ii.png"),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(child: Image.asset("assets/images/3x/logo.png")),
          const SizedBox(
            height: 200,
          ),
          Column(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login())),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(99, 10, 95, 10),
                    child: Text(
                      "Login",
                      style: context.theme.bodyLarge
                    ),
                  )),
                  const SizedBox(height: 5,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(
                      color: Colors.white, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp())),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(90, 10, 90, 10),
                    child: Text(
                      "SignUp",
                      style:  context.theme.bodyLarge!.copyWith(
                        color: Colors.white
                      )
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
