import 'package:ecommerz/app/app_colors.dart';
import 'package:ecommerz/app/app_theme_data.dart';
import 'package:ecommerz/app/controller_binder.dart';
import 'package:ecommerz/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerz/features/auth/ui/screens/email_verify_screen.dart';
import 'package:ecommerz/features/auth/ui/screens/otp_verify_screen.dart';
import 'package:ecommerz/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerz/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerz/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // named routing
      initialRoute: "/",
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      initialBinding: ControllerBinder(),
      routes: {
        "/" : (context) => const SplashScreen(),
        EmailVerifyScreen.name : (context) => const EmailVerifyScreen(),
        OTPVerifyScreen.name : (context) => const OTPVerifyScreen(),
        CompleteProfileScreen.name : (context) => const CompleteProfileScreen(),
        HomeScreen.name : (context) => const HomeScreen(),
        MainBottomNavScreen.name : (context) => const MainBottomNavScreen(),
      },
    );
  }
}
