import 'package:ecommerz/features/auth/ui/controllers/email_verify_controller.dart';
import 'package:ecommerz/features/auth/ui/controllers/login_user_controller.dart';
import 'package:ecommerz/features/auth/ui/controllers/otp_verify_controller.dart';
import 'package:ecommerz/features/auth/ui/controllers/signup_user_controller.dart';
import 'package:ecommerz/features/cart/ui/controller/add_to_cart_controller.dart';
import 'package:ecommerz/features/cart/ui/controller/cart_list_controller.dart';
import 'package:ecommerz/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerz/features/common/ui/controllers/category_list_controller.dart';
import 'package:ecommerz/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerz/features/home/ui/controller/slider_list_controller.dart';
import 'package:ecommerz/features/product/data/model/review_pagination_model.dart';
import 'package:ecommerz/features/product/ui/controller/product_details_controller.dart';
import 'package:ecommerz/features/product/ui/controller/product_list_controller.dart';
import 'package:ecommerz/features/product/ui/controller/product_review_controller.dart';
import 'package:ecommerz/features/wishlist/ui/controller/wish_list_controller.dart';
import 'package:ecommerz/serivces/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies(){
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(EmailVerifyController());
    Get.put(SignupUserController());
    Get.put(OTPVerifyController());
    Get.put(LoginUserController());
    Get.put(CategoryListController());
    Get.put(AuthController());
    Get.put(SliderListController());
    Get.put(WishListController());
    Get.put(CartListController());
    Get.put(ProductListController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(ReviewListController());
  }
}