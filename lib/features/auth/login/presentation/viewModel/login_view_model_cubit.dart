import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/ErrorModel.dart';
import 'package:flowery_e_commerce/core/networking/error/error_handler.dart';
import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigations.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/data_sources/contracts/offline_data_source.dart';
import '../../domain/entities/response/login_response_entity.dart';
import '../../domain/use_cases/auth_use_case.dart';
import 'login_action.dart';


part 'login_view_model_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginViewModelState> {
  final AuthUseCase _authUseCase;
  final OfflineDataSource _offlineDataSource = getIt<OfflineDataSource>();

  @factoryMethod
  LoginViewModel(this._authUseCase) : super(LoginViewModelInitial());

  void doAction(LoginScreenAction action) {
    switch (action) {
      case LoginAction():
        _login(action, action.context);
    }
  }

  Future<void> _login(LoginAction action, BuildContext context) async {
    emit(LoginViewModelLoading());
    var result = await _authUseCase.login(action.request);
    switch (result) {
      case Success<LoginResponseEntity>():
        {
          if (action.isRememberMe) {
            await _offlineDataSource.cacheToken(result.data.token ?? "");
          }
          emit(LoginViewModelSuccess(result.data));
          context.pushReplacementNamed(AppRoutes.homeScreen);
        }
      case Fail<LoginResponseEntity>():
        emit(LoginViewModelError(ErrorHandler.handle(result.exception!)));
    }
  }
}
