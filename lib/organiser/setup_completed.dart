import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isports/individual_player_account/player_info.dart';
import 'package:isports/shared/primary_button.dart';
import 'package:isports/shared/theme_data.dart';

class SetupCompleted extends StatelessWidget {
  const SetupCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/green_check.png',
              height: 140,
              width: 140,
            ),
            SizedBox(height: 30),
            Text(
              "You're In!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFAACC46)),
            ),
            SizedBox(height: 16),
            Text(
              "You're all set! Start exploring events, teams, and tournaments now",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: primaryColor),
            ),
            SizedBox(height: 24),
            PrimaryButton(text: 'Explore', onTap: () {
              Get.to(() => ProfileScreen());
            })
          ],
        ),
      ),
    );
  }
}
