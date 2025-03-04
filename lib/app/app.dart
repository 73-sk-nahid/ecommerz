import 'package:ecommerz/app/app_theme_data.dart';
import 'package:ecommerz/app/controller_binder.dart';
import 'package:ecommerz/features/auth/ui/screens/signup_screen.dart';
import 'package:ecommerz/features/auth/ui/screens/email_verify_screen.dart';
import 'package:ecommerz/features/auth/ui/screens/login_screen.dart';
import 'package:ecommerz/features/auth/ui/screens/otp_verify_screen.dart';
import 'package:ecommerz/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerz/features/auth/ui/screens/user_profile_screen.dart';
import 'package:ecommerz/features/cart/ui/screens/cart_list_screen.dart';
import 'package:ecommerz/features/category/ui/screens/category_list_screen.dart';
import 'package:ecommerz/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerz/features/home/ui/screens/home_screen.dart';
import 'package:ecommerz/features/product/ui/screens/add_review_screen.dart';
import 'package:ecommerz/features/product/ui/screens/create_review_screen.dart';
import 'package:ecommerz/features/product/ui/screens/product_details_screen.dart';
import 'package:ecommerz/features/product/ui/screens/product_list_screen.dart';
import 'package:ecommerz/features/product/ui/screens/product_review_screen.dart';
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
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if(settings.name == UserProfileScreen.name) {
          widget = UserProfileScreen();
        } else if (settings.name == LoginScreen.name) {
          widget = const LoginScreen();
        } else if (settings.name == EmailVerifyScreen.name) {
          widget = const EmailVerifyScreen();
        } else if (settings.name == OTPVerifyScreen.name) {
          String email = settings.arguments as String;
          widget = OTPVerifyScreen(email: email,);
        } else if (settings.name == SignUpScreen.name) {
          widget = const SignUpScreen();
        } else if (settings.name == HomeScreen.name) {
          widget = const HomeScreen();
        } else if (settings.name == CartListScreen.name) {
          widget = const CartListScreen();
        } else if (settings.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        } else if (settings.name == CategoryListScreen.name) {
          widget = const CategoryListScreen();
        } else if (settings.name == ProductListScreen.name) {
          Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
          widget = ProductListScreen(
            categoryName: args['categoryName'],
            categoryId: args['categoryId'],
          );
        } else if (settings.name == ProductDetailsScreen.name) {
          String productId = settings.arguments as String;
          widget = ProductDetailsScreen(productId: productId);
        }
        // else if (settings.name == ProductListScreen.name) {
        //   String name = settings.arguments as String;
        //   widget = ProductListScreen(categoryName: name);
        // } else if (settings.name == ProductDetailsScreen.name) {
        //   int productId = settings.arguments as int;
        //   widget = ProductDetailsScreen(productId: productId,);
        // }
        else if (settings.name == ProductReviewScreen.name) {
          String productId = settings.arguments as String;
          widget =  ProductReviewScreen(productId: productId,);
        }
        else if (settings.name == CreateReviewScreen.name) {
          widget = const CreateReviewScreen();
        }
        else if(settings.name == AddReviewScreen.name) {
          String productId = settings.arguments as String;
          widget =  AddReviewScreen(productID: productId,);
        }
        return MaterialPageRoute(builder: (ctx) {
          return widget;
        });
      },
    );
  }
}
