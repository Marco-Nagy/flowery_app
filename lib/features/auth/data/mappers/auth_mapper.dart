import 'package:flowery_e_commerce/features/auth/data/models/request/reset_password_request_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/request/signup_request_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/request/verify_reset_code_request_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/forget_password_response_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/signup_response_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/verify_reset_code_response.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/reset_password_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/response/forget_password_response_entity.dart';

import '../../domain/entities/request/login_request_entity.dart';
import '../../domain/entities/request/signup_request_entity.dart';
import '../../domain/entities/response/login_response_entity.dart';
import '../../domain/entities/response/signup_response_entity.dart';
import '../models/request/forget_password_request_dto.dart';
import '../models/request/login_request_dto.dart';
import '../models/response/login_response_dto.dart';

class AuthMapper {
  static LoginRequestDto toDto(LoginRequestEntity request) {
    return LoginRequestDto(email: request.email, password: request.password);
  }

  static LoginResponseEntity toEntity(LoginResponseDto response) {
    return LoginResponseEntity(
        message: response.message, token: response.token);
  }

  static SignUpRequestDto signUpToDto(SignUpRequestEntity request) {
    return SignUpRequestDto(
        email: request.email,
        password: request.password,
        rePassword: request.rePassword,
        gender: request.gender,
        firstName: request.firstName,
        lastName: request.lastName,
        phone: request.phone);
  }

  static SignUpResponseEntity signUpToEntity(SignUpResponseDto response) {
    return SignUpResponseEntity(
      message: response.message,
      token: response.token,
      error: response.error,
      user: mapUserFromDtoToEntity(response.user),
    );
  }

  static User mapUserFromDtoToEntity(UserDto? userDto) {
    if (userDto == null) return User();
    return User(
      firstName: userDto.firstName,
      lastName: userDto.lastName,
      email: userDto.email,
      gender: userDto.gender,
      phone: userDto.phone,
      photo: userDto.photo,
      role: userDto.role,
      id: userDto.Id,
      createdAt: userDto.createdAt,
    );
  }

  static ForgetPasswordResponseDto toForgetPasswordToDto(
      ForgetPasswordResponseEntity request) {
    return ForgetPasswordResponseDto(
      message: request.message,
      info: request.info,
    );
  }

  static ForgetPasswordRequestDto forgetPasswordToDto(
      ForgetPasswordRequestEntity request) {
    return ForgetPasswordRequestDto(email: request.email);
  }
  static ForgetPasswordResponseEntity forgetPasswordToEntity(
      ForgetPasswordResponseDto request) {
    return ForgetPasswordResponseEntity(message: request.message,info:  request.info);
  }

  static VerifyResetCodeRequestDto verifyResetCodeToDto(
      VerifyResetCodeRequestEntity request) {
    return VerifyResetCodeRequestDto(
      resetCode: request.resetCode,
    );

  }

  static VerifyResetCodeResponseDto verifyResetCodeToEntity(
      VerifyResetCodeResponseDto request) {
    return VerifyResetCodeResponseDto(
      status: request.status,
    );
  }

  static ResetPasswordRequestDto toResetPasswordRequestDto(
      ResetPasswordRequestEntity request) {
    return ResetPasswordRequestDto(
      email: request.email,
      newPassword: request.newPassword,
    );
  }
}
