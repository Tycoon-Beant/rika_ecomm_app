// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../di/service_locator.dart';
import '../../services/local_storage_service.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      getIt<LocalStorageService>().getToken().then((token) {
        if (token != null) {
          Navigator.of(context).pushReplacementNamed(AppRoute.navbar.path);
        } else {
          Navigator.of(context).pushReplacementNamed(AppRoute.onboarding.path);
        }
      });
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
