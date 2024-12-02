part of 'profile_view_model_cubit.dart';

@immutable
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

final class UploadPhotoLoading extends ProfileViewModelState {}
final class ChangePasswordLoading extends ProfileViewModelState {}

final class UploadPhotoSuccess extends ProfileViewModelState {
  final UploadPhotoResponseEntity data;
final class ChangePasswordSuccess extends ProfileViewModelState {
  final ChangePasswordResponseEntity data;

  UploadPhotoSuccess({required this.data});
  ChangePasswordSuccess({required this.data});
}

final class UploadPhotoError extends ProfileViewModelState {
final class ChangePasswordError extends ProfileViewModelState {
  final ErrorModel error;

  UploadPhotoError({required this.error});
  ChangePasswordError({required this.error});
}
