import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/main.dart';
import 'package:rika_ecomm_app/screens/on_boarding.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

import 'bottonnav/mine_page_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      final token = await context.read<LocalStorageService>().getToken();
      if (token != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MinePage(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoarding(),
          ),
        );
      // }
    }
  });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/3x/splash_i.png",
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Image.asset("assets/images/3x/logo.png"),
        ),
      ),
    );
  }
}
