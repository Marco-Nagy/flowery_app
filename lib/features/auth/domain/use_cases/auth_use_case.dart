import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../data/models/response/signup_response_dto.dart';
import '../contracts/auth_repo.dart';
import '../entities/request/login_request_entity.dart';
import '../entities/response/login_response_entity.dart';
import '../entities/request/signup_request_entity.dart';
import '../entities/response/signup_response_entity.dart';

@injectable
class AuthUseCase {
  final AuthRepository _authRepository;

  @factoryMethod
  AuthUseCase(this._authRepository);

  Future<DataResult<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    return await _authRepository.login(request);
  }

  Future<DataResult<SignUpResponseEntity>> signUp(
      SignUpRequestEntity request) async {
    return await _authRepository.signUp(request: request);
  }
}
