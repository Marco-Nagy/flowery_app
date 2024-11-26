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
