import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app.route.dart';
import 'build_manage_teams.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidation();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
              child: Image.asset(
            'assets/images/iSportsLogo.png',
          )),
        ));
  }

  getValidation() async {
    Timer(Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.onboardingScreen);
    });
}
}