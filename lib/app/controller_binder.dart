import 'package:ecommerz/features/auth/ui/controllers/email_verify_controller.dart';
import 'package:ecommerz/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerz/serivces/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies(){
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(EmailVerifyController());
  }
}