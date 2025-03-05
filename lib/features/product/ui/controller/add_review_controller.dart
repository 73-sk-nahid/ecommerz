import 'package:ecommerz/app/urls.dart';
import 'package:ecommerz/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerz/serivces/network_caller/network_caller.dart';
import 'package:get/get.dart';


class AddReviewController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> addReview(Map<String, dynamic> reviewInfo) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    String? accessToken = await Get.find<AuthController>().getUserData();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().postRequest(Urls.addReviewUrl, body: reviewInfo, accessToken: accessToken);
    if (response.isSuccess) {
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