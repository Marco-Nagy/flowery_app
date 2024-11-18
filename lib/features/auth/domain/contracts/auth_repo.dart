import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/response/login_response_entity.dart';
import '../entities/request/login_request_entity.dart';
import '../entities/request/signup_request_entity.dart';
import '../entities/response/signup_response_entity.dart';

abstract class AuthRepository {
  Future<DataResult<LoginResponseEntity>> login(LoginRequestEntity request);
  Future<DataResult<SignUpResponseEntity>> signUp(
      {required SignUpRequestEntity request});
}
