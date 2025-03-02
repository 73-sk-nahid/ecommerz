class Urls{
  static const String _baseURL = 'https://ecom-rs8e.onrender.com/api';
  static String verifyEmailURL(String email) => '$_baseURL/UserLogin/$email';
  static String verifyEmailOTP = '$_baseURL/auth/verify-otp';
  static String resendOTP = '$_baseURL/auth/resend-otp';
  static String userSignUp = '$_baseURL/auth/signup';
  static String userLogin = '$_baseURL/auth/login';
  static String categoryList = '$_baseURL/categories?';
  static String slidesURL = '$_baseURL/slides';
  static String productsUrl = '$_baseURL/products?';
  static String wishListUrl = '$_baseURL/wishlist?';
  static String cartListUrl = '$_baseURL/cart?';
  static String toCartUrl = '$_baseURL/cart';
  static String productDetailsUrl(String productId) => '$_baseURL/products/id/$productId';
  static String reviewUrl = '$_baseURL/reviews?';
}