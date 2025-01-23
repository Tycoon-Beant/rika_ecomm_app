import 'package:flutter/material.dart';

class PrivacyProlicy extends StatefulWidget {
  const PrivacyProlicy({super.key});

  @override
  State<PrivacyProlicy> createState() => _PrivacyProlicyState();
}

class _PrivacyProlicyState extends State<PrivacyProlicy> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Center(child: Text("Privacy Policy 🔏",style: Theme.of(context).textTheme.displayLarge,),),
    );
  }
}