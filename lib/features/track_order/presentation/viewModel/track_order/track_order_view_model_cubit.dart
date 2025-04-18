// ✅ track_order_view_model_cubit.dart (مُحدث)
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/core/networking/error/error_handler.dart';
import 'package:flowery_store/core/networking/error/error_model.dart';
import 'package:flowery_store/core/services/firebase_helper/fire_store_ref_key.dart';
import 'package:flowery_store/features/track_order/domain/entities/track_order_entity.dart';
import 'package:flowery_store/features/track_order/domain/use_cases/get_order_by_order_id_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

import 'track_order_actions.dart';

part 'track_order_view_model_state.dart';

@injectable
class TrackOrderViewModelCubit extends Cubit<TrackOrderViewModelState> {
  final GetOrderByOrderIdCase getOrderByOrderIdCase;

  TrackOrderViewModelCubit(this.getOrderByOrderIdCase) : super(TrackOrderViewModelInitial()) {
    debugPrint('📦 TrackOrderViewModelCubit initialized');
  }

  TrackOrderEntity? trackOrderEntity;
  void Function(LatLng)? locationUpdateCallback;
  StreamSubscription? _locationSubscription;
  int currentStep = 0;
  LatLng? sourceLatLng;
  LatLng? destinationLatLng;
  LatLng? driverLatLng;

  final Completer<GoogleMapController> mapController = Completer();

  final Location location = Location();
  double finalDistance = 0.0;
  double carDegree = 0.0;

  final Set<Polyline> polyLinesSet = {};
  final List<LatLng> listLocations = [];

  Future<void> doAction(TrackOrderActions action) async {
    debugPrint('🎬 doAction triggered: $action');
    switch (action) {
      case GetOrderDetails():
        await _getOrderDetails(action);
        break;
      case UpdateMapLocation():
        break;
    }
  }

  Future<void> _getOrderDetails(GetOrderDetails action) async {
    emit(TrackOrderViewModelLoading());
    Stream<DataResult<TrackOrderEntity>> resultStream = await getOrderByOrderIdCase(
      orderId: action.orderId,
      userId: action.userId,
    );

    _locationSubscription = resultStream.listen((result) {
      switch (result) {
        case Success<TrackOrderEntity>():
          trackOrderEntity = result.data;
          final latitude = trackOrderEntity?.driver?.location?.latitude;
          final longitude = trackOrderEntity?.driver?.location?.longitude;
          if (latitude != null && longitude != null) {
            final newLatLng = LatLng(latitude, longitude);
            _updateDriverLocation(newLatLng);
          }
          _updateOrderStatus(trackOrderEntity!);
          emit(GetTrackOrderSuccess(result.data));
        case Fail<TrackOrderEntity>():
          emit(TrackOrderViewModelError(ErrorHandler.handle(result.exception!)));
      }
    });
  }

  void _updateDriverLocation(LatLng driverLatLng) {
    this.driverLatLng = driverLatLng;
    locationUpdateCallback?.call(driverLatLng); // 🔁 Notify location listener
    emit(UpdateDriverLocation());
  }

  void _updateOrderStatus(TrackOrderEntity entity) {
    switch (entity.orders?.state) {
      case FireStoreRefKey.accepted:
      case FireStoreRefKey.picked:
        currentStep = 1;
        break;
      case FireStoreRefKey.outForDelivery:
        currentStep = 2;
        break;
      case FireStoreRefKey.arrived:
        currentStep = 3;
        break;
      case FireStoreRefKey.delivered:
        currentStep = 4;
        break;
      default:
        currentStep = 0;
    }
    emit(UpdateStatus());
  }

  @override
  Future<void> close() {
    _locationSubscription?.cancel();
    return super.close();
  }
}

enum OrderStatus { accepted, picked, outForDelivery, arrived, delivered }