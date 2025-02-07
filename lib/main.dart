import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:isports/models/subscription_model.dart';
import 'package:isports/organiser/subscription.dart';
import 'package:isports/shared/theme_data.dart';
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
      // initialRoute: AppRoutes.initial,
      // getPages: AppPages.routes,
      // home: Container(
      //     decoration: BoxDecoration(
      //         image: DecorationImage(
      //             image: AssetImage('assets/images/cricketbat.png'),
      //             fit: BoxFit.cover)),
      //   ),
    home: OrganizationSubscription(),
    );
  }
}
