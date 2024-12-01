import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flowery_e_commerce/features/auth/data/models/request/forget_password_request_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/request/reset_password_request_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/request/verify_reset_code_request_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/forget_password_response_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/reset_password_response_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/verify_reset_code_response.dart';
import 'package:flowery_e_commerce/features/best_seller/data/models/best_seller_response_model_entity.dart';
import 'package:flowery_e_commerce/features/categories/data/models/response/get_all_categories_response_dto.dart';
import 'package:flowery_e_commerce/features/categories/data/models/response/get_all_products_rsponse_dto.dart';
import 'package:flowery_e_commerce/features/home_screen/data/models/home_response_model_entity.dart';
import 'package:flowery_e_commerce/features/profile/data/models/response/get_logged_user_data_response_dto.dart';
import 'package:flowery_e_commerce/features/profile/data/models/response/upload_photo_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../features/auth/data/models/request/login_request_dto.dart';
import '../../../features/auth/data/models/request/signup_request_dto.dart';
import '../../../features/auth/data/models/response/login_response_dto.dart';
import '../../../features/generic/data/models/generic_response_dto.dart';
import '../../../features/auth/data/models/response/signup_response_dto.dart';
import '../../../features/product/data/models/response/product_response_dto.dart';
import '../../../features/profile/data/models/response/edit_profile_response_dto.dart';
import 'api_constants.dart';

part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;

  @POST(ApiConstants.signInApi)
  Future<LoginResponseDto> login(@Body() LoginRequestDto request);

  @POST(ApiConstants.registerApi)
  Future<SignUpResponseDto> signUp(@Body() SignUpRequestDto request);

  @POST(ApiConstants.forgotPasswordApi)
  Future<ForgetPasswordResponseDto> forgetPassword(
      @Body() ForgetPasswordRequestDto request);

  @POST(ApiConstants.verifyResetCodeApi)
  Future<VerifyResetCodeResponseDto> verifyResetCode(
      @Body() VerifyResetCodeRequestDto resetCode);

  @PUT(ApiConstants.resetPasswordApi)
  Future<ResetPasswordResponseDto> resetPassword(
      @Body() ResetPasswordRequestDto resetPassword);

  @GET("api/v1/{resourceName}")
  Future<GenericResponseDto> getGenericProduct(@Path("resourceName") String resourceName);


  @GET(ApiConstants.getAllCategories)
  Future<GetAllCategoriesResponseDto> getAllCategories();
  @GET(ApiConstants.getHomeApi)
  Future<HomeResponseModelEntity> getHome();

  @GET(ApiConstants.getAllProducts)
  Future<GetAllProductsRsponseDto> getAllProducts();
  @GET(ApiConstants.mostSellingProductsApi)
  Future<BestSellerResponseModelEntity> getMostSellingProducts();

  @GET(ApiConstants.getAllProducts)
  Future<ProductResponseDto> getProduct();

  @GET(ApiConstants.getLoggedUserData)
  Future<GetLoggedUserDataResponseDto> getLoggedUserData(
  );

  @PUT(ApiConstants.editProfile)
  Future<EditProfileResponseDto> editProfile(@Body() Map<String, dynamic> body);

  @PUT(ApiConstants.uploadPhoto)
  @MultiPart()
  Future<UploadPhotoResponseDto> uploadPhoto(@Part(name: "photo") File photo,
  );

// @PUT(ApiConstants.uploadPhoto)
// @MultiPart()
// Future<UploadPhotoResponseDto> uploadPhoto(
// @Body() File formData,);
}