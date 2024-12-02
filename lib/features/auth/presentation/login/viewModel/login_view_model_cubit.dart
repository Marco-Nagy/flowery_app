import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
import 'package:flowery_e_commerce/core/networking/error/error_handler.dart';
import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../data/data_sources/contracts/offline_data_source.dart';
import '../../../domain/entities/response/login_response_entity.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'login_action.dart';

part 'login_view_model_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginViewModelState> {
  final LoginUseCase _loginUseCase;
  final OfflineDataSource _offlineDataSource = getIt<OfflineDataSource>();

  @factoryMethod
  LoginViewModel(this._loginUseCase) : super(LoginViewModelInitial());

  void doAction(LoginScreenAction action) {
    switch (action) {
      case LoginAction():
        _login(action, action.context);
    }
  }

  Future<void> _login(LoginAction action, BuildContext context) async {
    emit(LoginViewModelLoading());
    var result = await _loginUseCase.login(action.request);
    switch (result) {
      case Success<LoginResponseEntity>():
        {
          if (action.isRememberMe) {
            await _offlineDataSource.cacheToken(result.data.token ?? "");
            print("${_offlineDataSource.getToken()}");
          }
          emit(LoginViewModelSuccess(result.data));
         // context.pushReplacementNamed(AppRoutes.homeScreen);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.pushReplacementNamed(AppRoutes.homeScreen);
          });

        }
      case Fail<LoginResponseEntity>():
        emit(LoginViewModelError(ErrorHandler.handle(result.exception!)));
    }
  }
}
