import 'package:ecommerz/features/auth/data/models/user_model.dart';

class UserDataModel {
  int? code;
  String? status;
  String? msg;
  UserModel? data;

  UserDataModel({this.code, this.status, this.msg, this.data});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
//
// class UserData {
//   String? firstName;
//   String? lastName;
//   String? email;
//   bool? emailVerified;
//   String? phone;
//   bool? phoneVerified;
//   String? avatarUrl;
//   String? city;
//
//   UserData(
//       {
//         this.firstName,
//         this.lastName,
//         this.email,
//         this.emailVerified,
//         this.phone,
//         this.phoneVerified,
//         this.avatarUrl,
//         this.city});
//
//   UserData.fromJson(Map<String, dynamic> json) {
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     email = json['email'];
//     emailVerified = json['email_verified'];
//     phone = json['phone'];
//     phoneVerified = json['phone_verified'];
//     avatarUrl = json['avatar_url'];
//     city = json['city'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['first_name'] = firstName;
//     data['last_name'] = lastName;
//     data['email'] = email;
//     data['email_verified'] = emailVerified;
//     data['phone'] = phone;
//     data['phone_verified'] = phoneVerified;
//     data['avatar_url'] = avatarUrl;
//     data['city'] = city;
//     return data;
//   }
// }
