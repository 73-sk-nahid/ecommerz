class Urls{
  static const String _baseURL = 'https://ecom-rs8e.onrender.com/api';
  static String verifyEmailURL(String email) => '$_baseURL/UserLogin/$email';
  static String userSignUp = '$_baseURL/auth/signup';
}