class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String? password;
  final String phone;
  final String city;
  final String? avatarUrl;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      this.password,
      required this.phone,
      required this.city,
      this.avatarUrl});

  // Convert object to JSON for API request
  Map<String, dynamic> toJson() {
    // ✅ Correct type
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": phone, // Let Dart handle the correct type
      "city": city,
      "avatar_url": avatarUrl
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        phone: json['phone'],
        city: json['city'],
        avatarUrl: json['avatar_url']);
  }
}
