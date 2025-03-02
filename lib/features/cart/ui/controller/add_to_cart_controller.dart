import 'package:ecommerz/app/urls.dart';
import 'package:ecommerz/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerz/serivces/network_caller/network_caller.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> addToCart(String productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    String? accessToken = await Get.find<AuthController>().getUserData();
    print(accessToken);
    Map<String, dynamic> body = {
      'product' : productId
    };
    final NetworkResponse response =
    await Get.find<NetworkCaller>().postRequest(Urls.toCartUrl, accessToken: accessToken, body: body);
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}