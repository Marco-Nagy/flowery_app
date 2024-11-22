
import 'package:dio/dio.dart';
import 'package:flowery_e_commerce/features/categories/data/models/response/get_all_categories_response_dto.dart';
import 'package:flowery_e_commerce/features/home_screen/data/models/home_response_model_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../features/auth/data/models/request/signup_request_dto.dart';
import '../../../features/auth/data/models/response/signup_response_dto.dart';
import '../../../features/auth/data/models/request/login_request_dto.dart';
import '../../../features/auth/data/models/response/login_response_dto.dart';
import '../../../features/generic/data/models/generic_response_dto.dart';
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

  @GET("api/v1/{resourceName}")
  Future<GenericResponseDto> getGenericProduct(@Path("resourceName") String resourceName);


  @GET(ApiConstants.getAllCategories)
  Future<GetAllCategoriesResponseDto> getAllCategories();
  @GET(ApiConstants.getHomeApi)
  Future<HomeResponseModelEntity> getHome();
}