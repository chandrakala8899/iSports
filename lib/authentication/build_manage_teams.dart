import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'methods.dart';
import 'mobile_number_screen.dart';
// import 'package:nsports/screens/resuableSection.dart';

class BuildAndManageTeams extends StatelessWidget {
  const BuildAndManageTeams({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.8, horizontal: 3.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildAndManageTeams(screenHeight),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF003572),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Get started',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
