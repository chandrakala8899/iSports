import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:isports/authentication/splash_screen.dart';
import 'package:isports/organiser/profile_create_home.dart';
import 'package:isports/shared/theme_data.dart';

import 'individual_player_account/player_info.dart';
import 'routes/app.page.dart';
import 'routes/app.route.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      getPages: AppPages.routes,
      home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/cricketbat.png'),
                  fit: BoxFit.cover)),
        ),
    );
  }
}
