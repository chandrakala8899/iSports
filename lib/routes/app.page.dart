import 'package:get/get.dart';
import 'package:isports/authentication/mobile_number_screen.dart';
import 'package:isports/authentication/onboarding_Screen/onboarding_screen.dart';
import 'package:isports/authentication/otp_verification.dart';

import '../authentication/build_manage_teams.dart';
import '../authentication/splash_screen.dart';
import 'app.route.dart';

class AppPages{
  static final routes = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.rightToLeftWithFade,
    ),

    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    
    GetPage(
      name: AppRoutes.onboardingScreen,
      page: () => OnboardingScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}