import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/response/forget_password_response_entity.dart';

import '../../data/models/response/reset_password_response_dto.dart';
import '../../data/models/response/verify_reset_code_response.dart';
import '../entities/request/forget_password_request_entity.dart';
import '../entities/request/login_request_entity.dart';
import '../entities/request/reset_password_request_entity.dart';
import '../entities/request/signup_request_entity.dart';
import '../entities/request/verify_reset_code_request_entity.dart';
import '../entities/response/login_response_entity.dart';
import '../entities/response/signup_response_entity.dart';

abstract class AuthRepository {
  Future<DataResult<LoginResponseEntity>> login(LoginRequestEntity request);

  Future<DataResult<SignUpResponseEntity>> signUp({required SignUpRequestEntity request});
  Future<DataResult<ForgetPasswordResponseEntity>> forgetPassword({required ForgetPasswordRequestEntity request});
  Future<DataResult<VerifyResetCodeResponseDto>> verifyResetCode({required VerifyResetCodeRequestEntity request});
  Future<DataResult<ResetPasswordResponseDto>> resetPassword({required ResetPasswordRequestEntity request});

  Future<DataResult<ForgetPasswordResponseEntity>> forgetPassword(
      {required ForgetPasswordRequestEntity request});

  Future<DataResult<VerifyResetCodeResponseDto>> verifyResetCode(
      {required VerifyResetCodeRequestEntity request});

  Future<DataResult<ResetPasswordResponseDto>> resetPassword(
      {required ResetPasswordRequestEntity request});
}
