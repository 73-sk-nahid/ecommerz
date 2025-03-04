import 'package:ecommerz/features/auth/ui/screens/login_screen.dart';
import 'package:ecommerz/features/auth/ui/screens/user_profile_screen.dart';
import 'package:ecommerz/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerz/features/product/ui/screens/add_review_screen.dart';
import 'package:ecommerz/features/product/ui/screens/product_review_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/app_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async{
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, UserProfileScreen.name);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            AppLogoWidget(),
            Spacer(),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
