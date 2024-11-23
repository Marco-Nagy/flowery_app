import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/api_execute.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/reset_password_response_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/verify_reset_code_response.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/login_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/reset_password_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/response/forget_password_response_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/request/signup_request_entity.dart';
import '../../../domain/entities/response/signup_response_entity.dart';
import '../../mappers/auth_mapper.dart';
import '../contracts/auth_online_data_source.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  AuthOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    return await executeApi(() async {
      var response = await _apiManager.login(AuthMapper.toDto(request));
      return AuthMapper.toEntity(response);
    });
  }

  Future<DataResult<SignUpResponseEntity>> signUp(
      {required SignUpRequestEntity request}) {
    return executeApi(() async {
      var response = await _apiManager.signUp(AuthMapper.signUpToDto(request));
      return AuthMapper.signUpToEntity(response);
    });
  }

  @override
  Future<DataResult<ForgetPasswordResponseEntity>> forgetPassword(
      {required ForgetPasswordRequestEntity request}) async {
    return await executeApi(() async {
      var response = await _apiManager.forgetPassword(AuthMapper.forgetPasswordToDto(request));
      return AuthMapper.forgetPasswordToEntity(response);
    });
  }

  @override
  Future<DataResult<ResetPasswordResponseDto>> resetPassword(
      {required ResetPasswordRequestEntity request}) async {
    return await executeApi(() async {
      var response = await _apiManager
          .resetPassword(AuthMapper.toResetPasswordRequestDto(request));
      return response;
    });
  }

  @override
  Future<DataResult<VerifyResetCodeResponseDto>> verifyResetCode(
      {required VerifyResetCodeRequestEntity request}) async {
    return await executeApi(() async {
      var response = await _apiManager
          .verifyResetCode(AuthMapper.verifyResetCodeToDto(request));
      return response;
    });
  }
}
