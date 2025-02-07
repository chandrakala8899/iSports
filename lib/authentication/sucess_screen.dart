import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../player/profile_setup.dart';

class Success_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/allSports.png',
              height: 300, 
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            'Let the game begin !!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Welcome to iSports - the ultimate platform for connecting athletes, organizers, and coaches! We're thrilled to have you on board.",
              textAlign: TextAlign.center, 
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => ProfileSetup());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003572),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Setup Profile',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Take me to home',
            style: TextStyle(fontSize: 14, color: const Color(0xFF003572)),
          ),
        ],
      ),
    );
  }
}
