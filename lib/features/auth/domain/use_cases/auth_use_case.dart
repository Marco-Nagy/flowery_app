import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../contracts/auth_repo.dart';
import '../entities/request/login_request_entity.dart';
import '../entities/response/login_response_entity.dart';

@injectable
class AuthUseCase {
  final AuthRepository _authRepository;

  @factoryMethod
  AuthUseCase(this._authRepository);

  Future<DataResult<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    print("thirrrrrrrrrrrrrrrrrd");
    return await _authRepository.login(request);
  }

// await _authRepository.login(request);
}
