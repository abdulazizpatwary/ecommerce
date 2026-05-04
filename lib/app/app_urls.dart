class AppUrls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';
  static const String signInUrl = '$_baseUrl/auth/login';
  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static const String sliderUrl = '$_baseUrl/slides';
  static const String categoriesUrl = '$_baseUrl/categories';
  static const String productListUrl = '$_baseUrl/products';

  static String productDetailsUrl(String productId) =>
      '$_baseUrl/products/id/$productId';
  static const String addToCartUrl = '$_baseUrl/cart';
  static const String getCartListUrl = '$_baseUrl/cart';

  static String removeCartItemUrl(String id) => '$_baseUrl/cart/$id';
  static const String addToWishListUrl = '$_baseUrl/wishlist';
  static const String getWishListUrl = '$_baseUrl/wishlist';
  static const String createReviewUrl = '$_baseUrl/review';
  static String deleteWishListItemUrl(String id) => '$_baseUrl/wishlist/$id';
  static const String getReviewListUrl = '$_baseUrl/reviews';
}
