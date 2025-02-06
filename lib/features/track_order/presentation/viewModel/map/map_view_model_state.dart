part of 'map_view_model_cubit.dart';

// sealed class MapViewModelState {}
//
// final class MapViewModelInitial extends MapViewModelState {}
//
// final class MapLoaded extends MapViewModelState {
//   final LatLng currentLocation;
//
//    MapLoaded({required this.currentLocation});
//
// }
//
// final class MapDirectionsLoaded extends MapViewModelState {
//   final List<LatLng> polylines;
//
//    MapDirectionsLoaded({required this.polylines});
//
// }
//
// final class MapError extends MapViewModelState {
//   final String message;
//
//   MapError({required this.message});
// }
//
//   final class TrackOrderViewModelLoading extends MapViewModelState {}
//
//
//   final class TrackOrderViewModelError extends MapViewModelState {
//   final ErrorModel errorModel;
//
//   TrackOrderViewModelError(this.errorModel);
//   }
//
//   final class GetTrackOrderSuccess extends MapViewModelState {
//   final TrackOrderEntity trackOrderEntity;
//
//   GetTrackOrderSuccess(this.trackOrderEntity);
//   }
//
// final class UpdateStatus extends MapViewModelState {
//
// }

sealed class MapViewModelState {}

final class MapViewModelInitial extends MapViewModelState {}

final class TrackOrderViewModelLoading extends MapViewModelState {}


final class TrackOrderViewModelError extends MapViewModelState {
  final ErrorModel errorModel;

  TrackOrderViewModelError(this.errorModel);
}

final class GetTrackOrderSuccess extends MapViewModelState {
  final TrackOrderEntity trackOrderEntity;

  GetTrackOrderSuccess(this.trackOrderEntity);
}



final class UpdateStatus extends MapViewModelState {

}