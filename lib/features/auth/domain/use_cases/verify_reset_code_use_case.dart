import 'package:flowery_store/core/networking/common/api_result.dart';

import 'package:flowery_store/features/auth/data/models/response/verify_reset_code_response.dart';
import 'package:flowery_store/features/auth/domain/contracts/auth_repo.dart';
import 'package:flowery_store/features/auth/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetCodeUseCase {
  AuthRepository authRepository;

  VerifyResetCodeUseCase(this.authRepository);

  Future<DataResult<VerifyResetCodeResponseDto>> call(
      VerifyResetCodeRequestEntity body) {
    return authRepository.verifyResetCode(request: body);
  }
}
