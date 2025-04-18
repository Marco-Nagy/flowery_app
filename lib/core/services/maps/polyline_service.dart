// polyline_service.dart
import 'dart:math' show cos, sqrt, asin;

import 'package:flowery_store/core/styles/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineService {
  static double totalDistance = 0.0;

  Future<Polyline> drawPolyline({
    required LatLng from,
    required LatLng to,
  }) async {
    await  dotenv.load(fileName: '.env.firebase');
    List<LatLng> polylineCoordinates = [];
    totalDistance = 0.0;

    final polylinePoints = PolylinePoints();
    final result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: dotenv.get('REAL_TIME_TRACKING_ANDROID_API_KEY'),
      request: PolylineRequest(
        origin: PointLatLng(from.latitude, from.longitude),
        destination: PointLatLng(to.latitude, to.longitude),
        mode: TravelMode.driving,
      ),
    );

    if (result.errorMessage != null) {
      debugPrint('Polyline error: ${result.errorMessage}');
    }

    for (final point in result.points) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    }

    _calculateTotalDistance(polylineCoordinates);
    debugPrint('Polyline API result: ${result.status}');
    debugPrint('Polyline API error: ${result.errorMessage}');
    return Polyline(
      polylineId:
          PolylineId("polyline_${DateTime.now().millisecondsSinceEpoch}"),
      color: MyColors.baseColor,
      width: 6,
      points: polylineCoordinates,
    );
  }

  void _calculateTotalDistance(List<LatLng> coordinates) {
    for (int i = 0; i < coordinates.length - 1; i++) {
      totalDistance += _coordinateDistance(
        coordinates[i].latitude,
        coordinates[i].longitude,
        coordinates[i + 1].latitude,
        coordinates[i + 1].longitude,
      );
    }
    debugPrint("Total distance = ${totalDistance.toStringAsFixed(2)} km");
  }

  double _coordinateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const p = 0.017453292519943295; // pi / 180
    final c = cos;
    final a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)); // 2 * R * asin...
  }
}
