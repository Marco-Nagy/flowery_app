import 'package:flowery_e_commerce/core/networking/common/api_result.dart';

import '../../../domain/entities/request/login_request_entity.dart';
import '../../../domain/entities/response/login_response_entity.dart';

abstract class AuthOnlineDataSource {
  Future<DataResult<LoginResponseEntity>> login(LoginRequestEntity request);
}
