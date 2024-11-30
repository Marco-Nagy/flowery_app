part of 'profile_view_model_cubit.dart';

sealed class ProfileViewModelState {}

final class ProfileViewModelInitial extends ProfileViewModelState {}

final class GetLoggedUserDataLoading extends ProfileViewModelState {}

final class GetLoggedUserDataSuccess extends ProfileViewModelState {
  final GetLoggedUserDataResponseEntity data;

  GetLoggedUserDataSuccess({required this.data});
}

final class GetLoggedUserDataError extends ProfileViewModelState {
  final ErrorModel error;

  GetLoggedUserDataError({required this.error});
}

final class EditProfileLoading extends ProfileViewModelState {}

final class EditProfileSuccess extends ProfileViewModelState {
  final EditProfileResponseEntity data;

  EditProfileSuccess({required this.data});
}

final class EditProfileError extends ProfileViewModelState {
  final ErrorModel error;

  EditProfileError({required this.error});
}
