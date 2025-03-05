import 'package:ecommerz/app/urls.dart';
import 'package:ecommerz/features/auth/data/models/user_data_model.dart';
import 'package:ecommerz/features/auth/data/models/user_model.dart';
import 'package:ecommerz/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerz/serivces/network_caller/network_caller.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  UserDataModel? _userDataModel;
  UserModel? get userModel => _userDataModel?.data;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<bool> getUserData() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    String? accessToken = await Get.find<AuthController>().getUserData();
    print(accessToken);
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.userProfile, accessToken: accessToken);
    if (response.isSuccess) {
      _userDataModel = UserDataModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> updateUserData() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    String? accessToken = await Get.find<AuthController>().getUserData();
    print(accessToken);
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.userProfile, accessToken: accessToken);
    if (response.isSuccess) {
      _userDataModel = UserDataModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

}