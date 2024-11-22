class ApiConstants {
  static const String baseUrl = "https://flower.elevateegy.com/";
  static const String signInApi = "api/v1/auth/signin";
  static const String registerApi = "api/v1/auth/signup";
  static const String forgotPasswordApi = "api/v1/auth/forgotPassword";
  static const String verifyResetCodeApi = "api/v1/auth/verifyResetCode";
  static const String resetPasswordApi = "api/v1/auth/resetPassword";
  static const String getAllCategories = "api/v1/categories";
  static const String getHomeApi = "api/v1/home";
  static String genericApi(String resourceName) => "api/v1/$resourceName";


}
