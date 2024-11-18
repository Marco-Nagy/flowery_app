import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/auth/login/domain/entities/request/login_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/login/domain/entities/response/login_response_entity.dart';


abstract class AuthOnlineDataSource {
  Future<DataResult<LoginResponseEntity>> login(LoginRequestEntity request);
}
