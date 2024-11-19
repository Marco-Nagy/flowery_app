import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:injectable/injectable.dart';
import '../contracts/auth_repo.dart';
import '../entities/request/login_request_entity.dart';
import '../entities/response/login_response_entity.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;

  @factoryMethod
  LoginUseCase(this._authRepository);

  Future<DataResult<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    return await _authRepository.login(request);
  }
}
