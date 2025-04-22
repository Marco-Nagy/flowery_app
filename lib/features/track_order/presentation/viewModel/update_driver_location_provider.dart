// update_driver_location_provider.dart
import 'dart:async';
import 'dart:math';

import 'package:flowery_store/core/services/maps/polyline_service.dart';
import 'package:flowery_store/features/track_order/presentation/viewModel/track_order/track_order_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class UpdateDriverLocationProvider with ChangeNotifier {
  final TrackOrderViewModelCubit viewModel;
  final Completer<GoogleMapController> mapController = Completer();

  LocationData? currentLocation;
  LatLng? sourceLatLng ;
  LatLng? destinationLatLng ;
  LatLng? driverLatLng ;
  // final Location location = Location();
  // Location driverCurrentLocation = Location();
  Timer? _timer;
  final List<LatLng> listLocations = [];
  final Set<Polyline> polyLinesSet = {};
  double carDegree = 0.0;

  double finalDistance = 0.0;
  bool markersInitialized = false;

  StreamSubscription<LocationData>? _locationSubscription;

  UpdateDriverLocationProvider(this.viewModel) {
    viewModel.locationUpdateCallback = (LatLng newLocation) async {
      driverLatLng = newLocation;
      // await initMarkers([driverLatLng!, destinationLatLng!]);

      if (mapController.isCompleted) {
        final controller = await mapController.future;
        await controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: driverLatLng!,
              zoom: 14.5,
              tilt: 60,
              bearing: 50,
            ),
          ),
        );
      }

      notifyListeners();
    };
  }

  Future<void> getCurrentLocation(LatLng current) async {
    try {
      if (viewModel.trackOrderEntity == null ||
          viewModel.trackOrderEntity?.orders == null ||
          viewModel.trackOrderEntity?.orders?.user?.location == null ||
          viewModel.trackOrderEntity?.orders?.store == null) {
        debugPrint('❗ Missing data, skipping location tracking init.');
        return;
      }

      sourceLatLng = LatLng(
        viewModel.trackOrderEntity!.orders!.store!.latitude,
        viewModel.trackOrderEntity!.orders!.store!.longitude,
      );

      destinationLatLng = LatLng(
        viewModel.trackOrderEntity!.orders!.user!.location!.latitude,
        viewModel.trackOrderEntity!.orders!.user!.location!.longitude,
      );

      driverLatLng = current;
      // ✅ Store it directly
      // syncDriverLocationFromCubit();
_updateDriverLocation(current);
      debugPrint('✅ driverLatLng initialized: $driverLatLng');


      notifyListeners(); // ✅ Very important!
    } catch (e) {
      debugPrint('❌ Error getting current location: $e');
    }
  }

  void _updateDriverLocation( LatLng currentLocation) async {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      driverLatLng =currentLocation;
///  📍 Driver: 31.219606, 29.941762
      ///  I/flutter (18609):  📍 Driver: 31.219606, 29.941762
      debugPrint(' 📍 Driver: ${driverLatLng?.latitude}, ${driverLatLng?.longitude}');
      await initMarkers([driverLatLng!, destinationLatLng!]);

            if (mapController.isCompleted) {
              final controller = await mapController.future;
              await controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(driverLatLng!.latitude, driverLatLng!.longitude),
                    zoom: 14.5,
                    tilt: 60,
                    bearing: 50,
                  ),
                ),
              );
            }

            // driverLatLng = LatLng(newLocation.latitude!, newLocation.longitude!);
            // notifyListeners();
          });
    // });
    notifyListeners();
  }

  Future<void> initMarkers(List<LatLng> locations) async {
    listLocations.clear();
    polyLinesSet.clear();
    listLocations.addAll(locations);
    await drawPolyLine(listLocations[0]);
  }

  Future<void> drawPolyLine(LatLng location) async {
    debugPrint('🟡 Source: ${sourceLatLng?.latitude}, ${sourceLatLng?.longitude}');
    debugPrint('🟡 Destination: ${destinationLatLng?.latitude}, ${destinationLatLng?.longitude}');
    try {
      for (final elem in listLocations) {
        final polyline = await PolylineService().drawPolyline(from: location, to: elem);
        finalDistance = PolylineService.totalDistance;
        polyLinesSet.add(polyline);
      }
      if (!hasListeners) return;
      notifyListeners();
    } catch (e) {
      debugPrint('❌ Failed to draw polyline: $e');
    }
  }

  static double calculateDegrees(LatLng startPoint, LatLng endPoint) {
    final double startLat = toRadians(startPoint.latitude);
    final double startLng = toRadians(startPoint.longitude);
    final double endLat = toRadians(endPoint.latitude);
    final double endLng = toRadians(endPoint.longitude);

    final double deltaLng = endLng - startLng;
    final double y = sin(deltaLng) * cos(endLat);
    final double x = cos(startLat) * sin(endLat) -
        sin(startLat) * cos(endLat) * cos(deltaLng);
    final double bearing = atan2(y, x);
    return (toDegrees(bearing) + 360) % 360;
  }

  static double toRadians(double degrees) => degrees * (pi / 180.0);
  static double toDegrees(double radians) => radians * (180.0 / pi);

  @override
  void dispose() {
    _locationSubscription?.cancel();
    viewModel.locationUpdateCallback = null;
    _timer?.cancel();
    debugPrint('🚫 UpdateDriverLocationViewModel disposed');
    super.dispose();
  }
}
