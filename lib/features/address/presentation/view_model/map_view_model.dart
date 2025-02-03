import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as loc;

class MapViewModel extends ChangeNotifier {
  loc.LocationData? currentLocation;
  LatLng? selectedLocation;
  String? street;
  String? city;
  double? longitude;
  double? latitude;
  bool isLoading = false;

  final loc.Location location = loc.Location();

  Future<void> getCurrentLocation() async {
    try {
      var userLocation = await location.getLocation();
      currentLocation = userLocation;
      selectedLocation = LatLng(
        userLocation.latitude!,
        userLocation.longitude!,
      );
      await getAddressFromLatLng(selectedLocation!);
      notifyListeners();
    } catch (e) {
      currentLocation = null;
    }
  }

  Future<void> getAddressFromLatLng(LatLng latLng) async {
    isLoading = true;
    notifyListeners();
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        city = place.subAdministrativeArea ?? 'Unknown City';
        street = place.street ?? 'Unknown Street';
        longitude = latLng.longitude;
        latitude = latLng.latitude;
      } else {
        city = 'Unknown City';
        street = 'Unknown Street';
      }
    } catch (e) {
      debugPrint("Error retrieving address: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void updateMarkerPosition(LatLng point) {
    selectedLocation = point;
    getAddressFromLatLng(point);
  }
//
  Map<String, String> getLocationData() {
    return {
      'street': street ?? '',
      'city': city ?? '',
      'latitude': latitude.toString(),
      'longitude': longitude.toString()
    };
  }
}
