part of 'profile_view_model_cubit.dart';

@immutable
sealed class ProfileViewModelState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProfileViewModelInitial extends ProfileViewModelState {

}

final class GetLoggedUserDataLoading extends ProfileViewModelState {}

final class GetLoggedUserDataSuccess extends ProfileViewModelState {
  final GetLoggedUserDataResponseEntity data;

  GetLoggedUserDataSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

final class GetLoggedUserDataError extends ProfileViewModelState {
  final ErrorModel error;

  GetLoggedUserDataError({required this.error});

  @override
  List<Object?> get props => [error];
}

final class EditProfileLoading extends ProfileViewModelState {}

final class EditProfileSuccess extends ProfileViewModelState {
  final EditProfileResponseEntity data;

  EditProfileSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

final class EditProfileError extends ProfileViewModelState {
  final ErrorModel error;

  EditProfileError({required this.error});

  @override
  List<Object?> get props => [error];
}

final class UploadPhotoLoading extends ProfileViewModelState {}
final class ChangePasswordLoading extends ProfileViewModelState {}

final class UploadPhotoSuccess extends ProfileViewModelState {
  final UploadPhotoResponseEntity data;

  UploadPhotoSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

final class ChangePasswordSuccess extends ProfileViewModelState {
  final ChangePasswordResponseEntity data;

  ChangePasswordSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

final class UploadPhotoError extends ProfileViewModelState {
  final ErrorModel error;

  UploadPhotoError({required this.error});

  @override
  List<Object?> get props => [error];
}

final class ChangePasswordError extends ProfileViewModelState {
  final ErrorModel error;

  ChangePasswordError({required this.error});

  @override
  List<Object?> get props => [error];
}
