import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/auth/domain/contracts/auth_repo.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/response/forget_password_response_entity.dart';
import 'package:injectable/injectable.dart';



@injectable
class ForgotPasswordUseCase {
  AuthRepository authRepository;

  ForgotPasswordUseCase(this.authRepository);

  Future<DataResult<ForgetPasswordResponseEntity>> call(
      ForgetPasswordRequestEntity body) {
    return authRepository.forgetPassword(request: body);
  }
}
