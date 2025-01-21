import 'package:ecommerz/app/app_colors.dart';
import 'package:ecommerz/app/app_theme_data.dart';
import 'package:ecommerz/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerz/features/auth/ui/screens/email_verify_screen.dart';
import 'package:ecommerz/features/auth/ui/screens/otp_verify_screen.dart';
import 'package:ecommerz/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // named routing
      initialRoute: "/",
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      routes: {
        "/" : (context) => const SplashScreen(),
        EmailVerifyScreen.name : (context) => const EmailVerifyScreen(),
        OTPVerifyScreen.name : (context) => const OTPVerifyScreen(),
        CompleteProfileScreen.name : (context) => const CompleteProfileScreen(),
      },
    );
  }
}
