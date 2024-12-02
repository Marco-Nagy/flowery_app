import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/reset_password_response_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/verify_reset_code_response.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/reset_password_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/response/forget_password_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/contracts/auth_repo.dart';
import '../../domain/entities/request/login_request_entity.dart';
import '../../domain/entities/request/signup_request_entity.dart';
import '../../domain/entities/response/login_response_entity.dart';
import '../../domain/entities/response/signup_response_entity.dart';
import '../data_sources/contracts/auth_online_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthOnlineDataSource _onlineDataSource;

  @factoryMethod
  AuthRepositoryImpl(this._onlineDataSource);

  @override
  Future<DataResult<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    var result = await _onlineDataSource.login(request);
    return result;
  }
  @override
  Future<DataResult<SignUpResponseEntity>> signUp(
      {required SignUpRequestEntity request}) async {
    var result = await _onlineDataSource.signUp(request: request);
    return result;
  }

  @override
  Future<DataResult<ForgetPasswordResponseEntity>> forgetPassword(
      {required ForgetPasswordRequestEntity request}) async {
    var result = await _onlineDataSource.forgetPassword(request: request);
    return result;
  }

  @override
  Future<DataResult<ResetPasswordResponseDto>> resetPassword(
      {required ResetPasswordRequestEntity request}) async {
    var result = await _onlineDataSource.resetPassword(request: request);
    return result;
  }

  @override
  Future<DataResult<VerifyResetCodeResponseDto>> verifyResetCode(
      {required VerifyResetCodeRequestEntity request}) async {
    var result = await _onlineDataSource.verifyResetCode(request: request);
    return result;
  }
}
