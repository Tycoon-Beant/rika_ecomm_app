import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/screens/splash_screen.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
         
         primaryColor: Colors.black,
          useMaterial3: true,
          fontFamily: "Mont_Blanc_Regular",
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white
          )
        ),
        home:const Splashscreen(),
      ),
    );
  }
}
