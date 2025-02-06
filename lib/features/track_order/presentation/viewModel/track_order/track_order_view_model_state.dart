part of 'track_order_view_model_cubit.dart';

sealed class TrackOrderViewModelState {}

final class TrackOrderViewModelInitial extends TrackOrderViewModelState {}

final class TrackOrderViewModelLoading extends TrackOrderViewModelState {}


final class TrackOrderViewModelError extends TrackOrderViewModelState {
  final ErrorModel errorModel;

  TrackOrderViewModelError(this.errorModel);
}

final class GetTrackOrderSuccess extends TrackOrderViewModelState {
  final TrackOrderEntity trackOrderEntity;

  GetTrackOrderSuccess(this.trackOrderEntity);
}



final class UpdateStatus extends TrackOrderViewModelState {

}

