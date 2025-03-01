class AuthSuccessModel {
  int? code;
  String? status;
  String? msg;
  UserData? data;

  AuthSuccessModel({this.code, this.status, this.msg, this.data});

  AuthSuccessModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
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

class UserData {
  String? token;
  UserDataModel? user;

  UserData({this.token, this.user});

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? UserDataModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class UserDataModel {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  bool? emailVerified;
  String? phone;
  bool? phoneVerified;
  String? avatarUrl;
  String? city;
  int? role;

  UserDataModel(
      {this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.emailVerified,
        this.phone,
        this.phoneVerified,
        this.avatarUrl,
        this.city,
        this.role});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerified = json['email_verified'];
    phone = json['phone'];
    phoneVerified = json['phone_verified'];
    avatarUrl = json['avatar_url'];
    city = json['city'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['email_verified'] = emailVerified;
    data['phone'] = phone;
    data['phone_verified'] = phoneVerified;
    data['avatar_url'] = avatarUrl;
    data['city'] = city;
    data['role'] = role;
    return data;
  }
}