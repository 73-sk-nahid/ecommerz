import 'dart:convert';
import 'package:ecommerz/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final String _accessTokenKey = 'access-token';
  final String _profileDataKey = 'access-token';

  String? accessToken;
  UserModel? profileModel;

  Future<void> saveUserData(String accessToken) async{
    print(accessToken);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, accessToken);
  }

  Future<String?> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString(_accessTokenKey);
    // profileModel = UserModel.fromJson(
    //   jsonDecode(sharedPreferences.getString(_profileDataKey)!),
    // );
    return accessToken;
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    if (token != null) {
      await getUserData();
      return true;
    }
    return false;
  }

  Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}