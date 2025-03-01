import 'package:ecommerz/app/urls.dart';
import 'package:ecommerz/features/auth/data/models/auth_success_model.dart';
import 'package:ecommerz/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerz/serivces/network_caller/network_caller.dart';
import 'package:get/get.dart';

class OTPVerifyController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> verifyOTP(Map<String, dynamic> userOTP) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(Urls.verifyEmailOTP, body: userOTP);
    if (response.isSuccess) {
      AuthSuccessModel authSuccessModel = AuthSuccessModel.fromJson(response.responseData);
      await Get.find<AuthController>().saveUserData(authSuccessModel.data!.token!);
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}