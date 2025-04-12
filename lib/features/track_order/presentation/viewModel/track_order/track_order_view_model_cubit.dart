// ✅ Updated TrackOrderViewModelCubit with safe polyline and camera animation fixes
import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/core/networking/error/error_handler.dart';
import 'package:flowery_store/core/networking/error/error_model.dart';
import 'package:flowery_store/core/services/firebase_helper/fire_store_ref_key.dart';
import 'package:flowery_store/features/track_order/domain/entities/track_order_entity.dart';
import 'package:flowery_store/features/track_order/domain/use_cases/get_order_by_order_id_case.dart';
import 'package:flowery_store/flowery_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:flowery_store/core/services/maps/polyline_service.dart';

import 'track_order_actions.dart';

part 'track_order_view_model_state.dart';

@injectable
class TrackOrderViewModelCubit extends Cubit<TrackOrderViewModelState> {
  final GetOrderByOrderIdCase getOrderByOrderIdCase;

  TrackOrderViewModelCubit(this.getOrderByOrderIdCase) : super(TrackOrderViewModelInitial()) {
    debugPrint('📦 TrackOrderViewModelCubit initialized');
  }

  TrackOrderEntity? trackOrderEntity;
  int currentStep = 0;
  LatLng sourceLatLng = const LatLng(0.0, 0.0);
  LatLng destinationLatLng = const LatLng(0.0, 0.0);
  LatLng driverLatLng = const LatLng(0.0, 0.0);
  final Completer<GoogleMapController> mapController = Completer();

  final Location location = Location();
  Timer? _timer;
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
        await _updateDriverAndDraw(LatLng(action.driverLat, action.driverLng));
        break;
    }
  }

  Future<void> _getOrderDetails(GetOrderDetails action) async {
    emit(TrackOrderViewModelLoading());
    final resultStream = await getOrderByOrderIdCase(
      orderId: action.orderId,
      userId: action.userId,
    );
    resultStream.listen((result) {
      switch (result) {
        case Success<TrackOrderEntity>():
          trackOrderEntity = result.data;
          _updateOrderStatus(trackOrderEntity!);
          emit(GetTrackOrderSuccess(result.data));
          break;
        case Fail<TrackOrderEntity>():
          final error = ErrorHandler.handle(result.exception!);
          emit(TrackOrderViewModelError(error));
          break;
      }
    });
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

  Future<void> _updateDriverAndDraw(LatLng currentDriverLocation) async {
    if (!_validateOrderData()) return;

    sourceLatLng = LatLng(
      trackOrderEntity!.orders!.store?.latitude ?? 0.0,
      trackOrderEntity!.orders!.store?.longitude ?? 0.0,
    );

    destinationLatLng = LatLng(
      trackOrderEntity!.orders!.user?.location?.latitude ?? 0.0,
      trackOrderEntity!.orders!.user?.location?.longitude ?? 0.0,
    );

    driverLatLng = LatLng(trackOrderEntity! .driver?.location?.latitude ?? 0.0, trackOrderEntity! .driver?.location?.longitude ?? 0.0);
    // await drawSafePolyline(driverLatLng);

    // if (_timer == null || !_timer!.isActive) {
      _startDriverLocationUpdater();
    // }

    emit(UpdateDriverLocation());
  }

  void _startDriverLocationUpdater() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) async {
      if (_areSamePoint(driverLatLng, destinationLatLng)) return;

      await initMarkers([sourceLatLng, destinationLatLng]);
      await _moveCameraTo(driverLatLng);
      emit(UpdateDriverLocation());
    });
  }
  bool _isMapReady = false;

  void onMapReady() async {
    _isMapReady = true;
    debugPrint('🗺️ Map is ready. Initializing polyline...');

    if (driverLatLng != const LatLng(0.0, 0.0) &&
        destinationLatLng != const LatLng(0.0, 0.0)) {
      await _drawSafePolyline(driverLatLng, destinationLatLng);
    } else {
      debugPrint('⚠️ Driver or Destination coordinates are invalid. Skipping polyline draw.');
    }
  }
  Future<void> _drawSafePolyline(LatLng from, LatLng to) async {
    if (_areSamePoint(from, to)) {
      debugPrint('! Skipping polyline: from and to are the same.');
      return;
    }

    try {
      polyLinesSet.clear();
      final polyline = await PolylineService().drawPolyline(from: from, to: to);
      polyLinesSet.add(polyline);
      finalDistance = PolylineService.totalDistance;
      debugPrint('🛣️ Polyline drawn. Distance: ${finalDistance.toStringAsFixed(2)} km');

      emit(UpdateDriverLocation()); // or a dedicated state like UpdatePolyLines()
    } catch (e) {
      debugPrint('❌ Failed to draw polyline: $e');
    }
  }



  Future<void> initMarkers(List<LatLng> locations) async {
    listLocations.clear();
    polyLinesSet.clear();
    listLocations.addAll(locations);
    await drawPolyLine(listLocations[0]);
  }
  Future<void> drawPolyLine(LatLng location) async {
    for (final elem in listLocations) {
      final polyline = await PolylineService().drawPolyline(from: location, to: elem);
      finalDistance = PolylineService.totalDistance;
      polyLinesSet.add(polyline);
    }
    emit(UpdateDriverLocation());
  }
  Future<void> _moveCameraTo(LatLng target) async {
    if (!mapController.isCompleted) return;
    if (_areSamePoint(driverLatLng, target)) return;

    final controller = await mapController.future;
    try {
      await controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: target,
            zoom: 14.5,
            tilt: 60,
            bearing: 50,
          ),
        ),
      );
    } catch (e) {
      debugPrint('❌ Camera animation failed: $e');
    }
  }

  bool _areSamePoint(LatLng a, LatLng b) => a.latitude == b.latitude && a.longitude == b.longitude;

  bool _validateOrderData() {
    final valid = trackOrderEntity?.orders?.user?.location != null &&
        trackOrderEntity?.orders?.store != null && trackOrderEntity?.driver?.location != null;
    return valid;
  }

  void setEntityAndStartTracking(TrackOrderEntity entity) {
    trackOrderEntity = entity;
    emit(GetTrackOrderSuccess(entity));
    doAction(UpdateMapLocation(
      driverLat: entity.driver?.location?.latitude ?? 0.0,
      driverLng: entity.driver?.location?.longitude ?? 0.0,
    ));
  }

  static double calculateDegrees(LatLng start, LatLng end) {
    final startLat = toRadians(start.latitude);
    final startLng = toRadians(start.longitude);
    final endLat = toRadians(end.latitude);
    final endLng = toRadians(end.longitude);
    final deltaLng = endLng - startLng;
    final y = sin(deltaLng) * cos(endLat);
    final x = cos(startLat) * sin(endLat) -
        sin(startLat) * cos(endLat) * cos(deltaLng);
    return (toDegrees(atan2(y, x)) + 360) % 360;
  }

  static double toRadians(double degrees) => degrees * (pi / 180.0);
  static double toDegrees(double radians) => radians * (180.0 / pi);
}

enum OrderStatus { accepted, picked, outForDelivery, arrived, delivered }