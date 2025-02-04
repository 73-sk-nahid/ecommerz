class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String city;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.city,
  });

  // Convert object to JSON for API request
  Map<String, String> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": phone,
      "city": city,
    };
  }
}
