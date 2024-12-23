part of 'login_view_model_cubit.dart';

@immutable
sealed class LoginViewModelState {}

final class LoginViewModelInitial extends LoginViewModelState {}

final class LoginViewModelLoading extends LoginViewModelState {}

final class LoginViewModelSuccess extends LoginViewModelState {
  final LoginResponseEntity response;

  LoginViewModelSuccess(this.response);
}

final class LoginViewModelError extends LoginViewModelState {
  final ErrorModel errorMessage;

  LoginViewModelError(this.errorMessage);
}

final class LocationPermissionDenied extends LoginViewModelState {}