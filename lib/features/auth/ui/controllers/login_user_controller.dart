import 'package:ecommerz/app/urls.dart';
import 'package:ecommerz/features/auth/data/models/user_model.dart';
import 'package:ecommerz/serivces/network_caller/network_caller.dart';
import 'package:get/get.dart';


class LoginUserController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  UserModel? _user;
  UserModel? get user => _user;

  Future<bool> logInUser(Map<String, dynamic> userInfo) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().postRequest(Urls.userLogin, body: userInfo);
    if (response.isSuccess) {
      final data = response.responseData['data'];
      _user = UserModel.fromJson(data['user']);
      print(_user?.firstName);
      print(_user?.lastName);
      print(_user?.email);
      print(_user?.phone);
      print(_user?.avatarUrl);
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