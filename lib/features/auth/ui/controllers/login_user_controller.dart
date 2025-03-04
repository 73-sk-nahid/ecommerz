import 'package:ecommerz/app/urls.dart';
import 'package:ecommerz/features/auth/data/models/auth_success_model.dart';
import 'package:ecommerz/features/auth/data/models/user_model.dart';
import 'package:ecommerz/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerz/serivces/network_caller/network_caller.dart';
import 'package:get/get.dart';


class LoginUserController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  final List<UserModel> _userData = [];
  List<UserModel> get userData => _userData;

  Future<bool> logInUser(Map<String, dynamic> userInfo) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().postRequest(Urls.userLogin, body: userInfo);
    if (response.isSuccess) {
      //final data = response.responseData['data'];
      //_user = UserModel.fromJson(data['user']);
      AuthSuccessModel authSuccessModel = AuthSuccessModel.fromJson(response.responseData);
      //_userData.addAll(authSuccessModel.data?.user ?? []);
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