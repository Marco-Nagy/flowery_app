import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/reset_password_response_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/verify_reset_code_response.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/response/forget_password_response_entity.dart';
import 'package:flowery_e_commerce/features/auth/presentation/forget_password/ViewModel/forget_password_view_model_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/error/error_handler.dart';
import '../../../domain/use_cases/forgot_password_use_case.dart';
import '../../../domain/use_cases/reset_password_use_case.dart';
import '../../../domain/use_cases/verify_reset_code_use_case.dart';
import 'forget_password_base_actions.dart';

@injectable
class ForgetPasswordViewModelCubit extends Cubit<ForgetPasswordViewModelState> {
  ForgetPasswordViewModelCubit(
    this.forgotPasswordUseCase,
    this.verifyResetCodeUseCase,
    this.resetPasswordUseCase,
  ) : super(ForgetPasswordInitial());
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final VerifyResetCodeUseCase verifyResetCodeUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
   TextEditingController emailController = TextEditingController();
  String fullCode = '';
  int time = 0;
  Timer? _timer;
  late ValueNotifier<String> timeMessage = ValueNotifier<String>("00:00");

  void doAction(ForgetPasswordBaseActions action) {
    switch (action) {
      case ForgetPasswordAction():

        _forgotPassword(action);
      case VerifyResetCodeAction():
        _verifyResetCode(action);
      case ResetPasswordAction():
        _resetPassword(action);
      case StartTimer():
        initTimer();
    }
  }

  Future<void> _forgotPassword(ForgetPasswordAction action) async {
    emit(ForgetPasswordLoading());
    var result = await forgotPasswordUseCase(action.body);
    switch (result) {
      case Success<ForgetPasswordResponseEntity>():

        emit(ForgetPasswordSuccess(result.data));

      case Fail<ForgetPasswordResponseEntity>():
        emit(ForgetPasswordFailed(ErrorHandler.handle(result.exception!)));
    }
  }

  Future<void> _verifyResetCode(VerifyResetCodeAction action) async {
    emit(VerifyResetCodeLoading());
    var result = await verifyResetCodeUseCase(action.body);
    switch (result) {
      case Success<VerifyResetCodeResponseDto>():
        emit(VerifyResetCodeSuccess(result.data));
      case Fail<VerifyResetCodeResponseDto>():
        emit(VerifyResetCodeFailed(ErrorHandler.handle(result.exception!)));
    }
  }

  Future<void> _resetPassword(ResetPasswordAction action) async {
    emit(ResetPasswordLoading());
    var result = await resetPasswordUseCase(action.body);
    switch (result) {
      case Success<ResetPasswordResponseDto>():
        emit(ResetPasswordSuccess(result.data));
      case Fail<ResetPasswordResponseDto>():
        emit(ResetPasswordFailed(ErrorHandler.handle(result.exception!)));
    }
  }

  initTimer() {
    time = 10;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      startCountdown,
    );
  }

  void startCountdown(Timer timer) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time > 0) {
        time--;
        _updateTime();
      } else {
        _timer?.cancel();
        emit(VerifyResetCodeTimeOut());
        // TimeOutDialog.show();
      }
    });
  }

  void _updateTime() {
    String minutes = (time ~/ 60).toString().padLeft(2, '0');
    String seconds = (time % 60).toString().padLeft(2, '0');
    timeMessage.value = '$minutes:$seconds';
  }
}
