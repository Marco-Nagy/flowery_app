part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final SignUpResponseEntity response;

  SignupSuccess(this.response);
}

class SignupError<T> extends SignupState {
  final T? exception;

  SignupError({this.exception});
}

class SignupGenderSelected extends SignupState {
  final String gender;

  SignupGenderSelected(this.gender);
}
