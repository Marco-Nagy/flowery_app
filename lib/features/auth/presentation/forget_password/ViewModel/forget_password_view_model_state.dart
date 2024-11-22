
import 'package:flowery_e_commerce/features/auth/data/models/response/reset_password_response_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/verify_reset_code_response.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/response/forget_password_response_entity.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/networking/error/error_model.dart';

@immutable
sealed class ForgetPasswordViewModelState {}

final class ForgetPasswordInitial extends ForgetPasswordViewModelState {}

/// ForgetPassword states
class ForgetPasswordLoading extends ForgetPasswordViewModelState {}

class ForgetPasswordSuccess extends ForgetPasswordViewModelState {
  final ForgetPasswordResponseEntity response;

  ForgetPasswordSuccess(this.response);
}

class ForgetPasswordFailed extends ForgetPasswordViewModelState {
  final ErrorModel errorModel;

  ForgetPasswordFailed(this.errorModel);
}

/// Verify Code states
class VerifyResetCodeLoading extends ForgetPasswordViewModelState {}

class VerifyResetCodeTimeOut extends ForgetPasswordViewModelState {}


class VerifyResetCodeSuccess extends ForgetPasswordViewModelState {
  final VerifyResetCodeResponseDto response;

  VerifyResetCodeSuccess(this.response);
}

class VerifyResetCodeFailed extends ForgetPasswordViewModelState {
  final ErrorModel errorModel;

  VerifyResetCodeFailed(this.errorModel);
}

/// Reset Password states
class ResetPasswordLoading extends ForgetPasswordViewModelState {}

class ResetPasswordSuccess extends ForgetPasswordViewModelState {
  final ResetPasswordResponseDto response;

  ResetPasswordSuccess(this.response);
}

class ResetPasswordFailed extends ForgetPasswordViewModelState {
  final ErrorModel errorModel;

  ResetPasswordFailed(this.errorModel);
}

