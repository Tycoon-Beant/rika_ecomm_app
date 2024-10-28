import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
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
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          return MediaQuery(
            data: mediaQueryData.copyWith(
                textScaler: const TextScaler.linear(1.0)),
            child: child!,
          );
        },
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
                headlineSmall: TextStyle(
                    fontSize: 28,
                    fontFamily: FontFamily.w700,
                    color: Colors.black),
                titleMedium:
                    TextStyle(fontFamily: FontFamily.w700, color: Colors.black),
              ),
          primaryColor: Colors.black,
          useMaterial3: true,
          fontFamily: "Mont_Blanc_Regular",
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        ),
        home: const Splashscreen(),
      ),
    );
  }
}
