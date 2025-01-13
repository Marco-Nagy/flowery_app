import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flowery_e_commerce/features/address_details/data/models/response/add_address_response_dto.dart';
import 'package:flowery_e_commerce/features/address/data/models/response/saved_address_response_entity_dto_entity.dart';
import 'package:flowery_e_commerce/features/auth/data/models/request/forget_password_request_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/request/reset_password_request_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/request/verify_reset_code_request_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/forget_password_response_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/reset_password_response_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/verify_reset_code_response.dart';
import 'package:flowery_e_commerce/features/best_seller/data/models/best_seller_response_model_entity.dart';
import 'package:flowery_e_commerce/features/cart/data/models/request/add_product_to_cart_request_dto.dart';
import 'package:flowery_e_commerce/features/cart/data/models/request/update_cart_product_quantity_request_dto.dart';
import 'package:flowery_e_commerce/features/cart/data/models/response/add_to_cart_response_dto.dart';
import 'package:flowery_e_commerce/features/cart/data/models/response/cart_response_dto.dart';
import 'package:flowery_e_commerce/features/cart/data/models/response/remove_from_cart_response_dto.dart';
import 'package:flowery_e_commerce/features/categories/data/models/response/get_all_categories_response_dto.dart';
import 'package:flowery_e_commerce/features/categories/data/models/response/get_all_products_rsponse_dto.dart';
import 'package:flowery_e_commerce/features/checkout/data/models/request/shipping_address_request_dto.dart';
import 'package:flowery_e_commerce/features/checkout/data/models/response/checkout_orders_response_dto.dart';
import 'package:flowery_e_commerce/features/home_screen/data/models/home_response_model_entity.dart';
import 'package:flowery_e_commerce/features/profile/data/models/request/change_password_request_dto.dart';
import 'package:flowery_e_commerce/features/profile/data/models/response/change_password_response_dto.dart';
import 'package:flowery_e_commerce/features/profile/data/models/response/get_logged_user_data_response_dto.dart';
import 'package:flowery_e_commerce/features/profile/data/models/response/upload_photo_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../features/address_details/data/models/request/add_address_request_dto.dart';
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

  @POST(ApiConstants.cart)
  Future<AddToCartResponseDto> addProductToCart(
      @Body() AddProductToCartRequestDto body);

  @PUT("${ApiConstants.updateProductCartQuantity}{id}")
  Future<CartResponseDto> updateCartQuantity(
      @Path("id") String id, @Body() UpdateCartProductQuantityRequestDto body);

  @DELETE("${ApiConstants.deleteProductFromCart}{id}")
  Future<RemoveFromCartResponseDto> removeProductFromCart(@Path("id") String id);

  @GET(ApiConstants.cart)
  Future<CartResponseDto> getCartData();

  @GET(ApiConstants.getLoggedUserAddresses)
  Future<SavedAddressResponseEntityDtoEntity> getSavedAddresses();

  @DELETE(ApiConstants.cart)
  Future<String> clearCartItems();
  @PUT(ApiConstants.editProfile)
  Future<EditProfileResponseDto> editProfile(@Body() Map<String, dynamic> body);

  @PUT(ApiConstants.uploadPhoto)
  @MultiPart()
  Future<UploadPhotoResponseDto> uploadPhoto(@Part(name: "photo") File photo,
  );
  @PATCH(ApiConstants.changePassword)
  Future<ChangePasswordResponseDto> changePassword(
      @Body() ChangePasswordRequestDto request);

// @PUT(ApiConstants.uploadPhoto)
// @MultiPart()
// Future<UploadPhotoResponseDto> uploadPhoto(
// @Body() File formData,);

  @PATCH(ApiConstants.addAddress)
  Future<AddAddressResponseDto> addAddress(
      @Body() AddAddressRequestDto request);

  @POST("${ApiConstants.checkOutOrders}")
  Future<CheckoutOrdersResponseDto> checkoutOrders(@Query("url") String endpointUrl,  @Body() ShippingAddressRequestDto request);

  @POST("${ApiConstants.cashOrders}")
  Future<CheckoutOrdersResponseDto> cashOrders( @Body() ShippingAddressRequestDto request);
}