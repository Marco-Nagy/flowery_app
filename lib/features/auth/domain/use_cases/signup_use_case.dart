import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:injectable/injectable.dart';
import '../contracts/auth_repo.dart';
import '../entities/request/signup_request_entity.dart';
import '../entities/response/signup_response_entity.dart';

@injectable
class SignUpUseCase {
  final AuthRepository _authRepository;

  @factoryMethod
  SignUpUseCase(this._authRepository);

  Future<DataResult<SignUpResponseEntity>> signUp(
      SignUpRequestEntity request) async {
    return await _authRepository.signUp(request: request);
  }
}
