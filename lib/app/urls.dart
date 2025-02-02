class Urls{
  static const String _baseURL = 'https://craftybay.teamrabbil.com/api';
  static String verifyEmailURL(String email) => '$_baseURL/UserLogin/$email';
}