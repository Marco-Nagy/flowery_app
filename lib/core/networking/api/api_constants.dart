class ApiConstants {
  static const String baseUrl = "https://flower.elevateegy.com/";
  static const String signInApi = "api/v1/auth/signin";
  static const String registerApi = "api/v1/auth/signup";
  static const String forgotPasswordApi = "api/v1/auth/forgotPassword";
  static const String verifyResetCodeApi = "api/v1/auth/verifyResetCode";
  static const String resetPasswordApi = "api/v1/auth/resetPassword";
  static const String getAllCategories = "api/v1/categories";
  static const String getHomeApi = "api/v1/home";
  static const String mostSellingProductsApi = "api/v1/best-seller";
  static String genericApi(String resourceName) => "api/v1/$resourceName";
  static const String getAllProducts = "api/v1/products";
  static const String getLoggedUserData = "api/v1/auth/profile-data";
  static const String editProfile = "api/v1/auth/editProfile";
  static const String changePassword = "api/v1/auth/change-password";
  static const String uploadPhoto = "api/v1/auth/upload-photo";
  static const String cart = "api/v1/cart";
  static const String updateProductCartQuantity = "api/v1/cart/";
  static const String deleteProductFromCart = "api/v1/cart/";

}
