import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';

class SuccesfullScreen extends StatefulWidget {
  const SuccesfullScreen({super.key});

  @override
  State<SuccesfullScreen> createState() => _SuccesfullScreenState();
}

class _SuccesfullScreenState extends State<SuccesfullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 100,),
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
                  ],
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              ),
              onPressed: () =>
                  Navigator.of(context).pushNamedAndRemoveUntil("/navbar", (route) => false),
              child: Text(
                "Start Shopping",
                style: context.theme.titleMedium!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
