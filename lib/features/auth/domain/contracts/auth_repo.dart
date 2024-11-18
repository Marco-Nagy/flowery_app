import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/response/login_response_entity.dart';
import '../entities/request/login_request_entity.dart';

abstract class AuthRepository {
  Future<DataResult<LoginResponseEntity>> login(LoginRequestEntity request);
}
