part of 'signup_view_model_cubit.dart';

@immutable
sealed class SignUpViewModelState {}

final class SignupInitial extends SignUpViewModelState {}

final class SignupLoading extends SignUpViewModelState {}

final class SignupSuccess extends SignUpViewModelState {
  final SignUpResponseEntity response;

  SignupSuccess(this.response);
}

class SignupError extends SignUpViewModelState {
  final ErrorModel message;

  SignupError(this.message);
}

class SignupGenderSelected extends SignUpViewModelState {
  final String gender;

  SignupGenderSelected(this.gender);
}
