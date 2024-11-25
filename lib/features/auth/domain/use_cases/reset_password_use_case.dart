import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/reset_password_response_dto.dart';
import 'package:flowery_e_commerce/features/auth/domain/contracts/auth_repo.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/reset_password_request_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  AuthRepository authRepository;

  ResetPasswordUseCase(this.authRepository);

  Future<DataResult<ResetPasswordResponseDto>> call(
      ResetPasswordRequestEntity body) {
    return authRepository.resetPassword(request: body);
  }
}
