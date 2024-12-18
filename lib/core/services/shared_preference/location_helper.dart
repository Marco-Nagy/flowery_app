import 'package:flowery_e_commerce/di/di.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../features/auth/data/data_sources/contracts/offline_data_source.dart';
class LocationHelper {
  final OfflineDataSource offlineDataSource = getIt<OfflineDataSource>();

  Future<void> saveLocation(String location) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = await offlineDataSource.getToken();
      await prefs.setString('location_$token', location);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getSavedLocation() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = await offlineDataSource.getToken();
      return prefs.getString('location_$token');
    } catch (e) {
      return null;
    }
  }

  Future<bool> isLocationServiceEnabled() async {
    try {
      return await Geolocator.isLocationServiceEnabled();
    } catch (e) {
      return false;
    }
  }

  Future<LocationPermission> requestLocationPermission( BuildContext context) async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      return permission;
    } catch (e) {
      throw Exception(AppLocalizations.of(context)!.failure);
    }
  }

  Future<Position> getCurrentLocation( BuildContext context) async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
    } catch (e) {
      throw Exception(AppLocalizations.of(context)!.failure);
    }
  }

  Future<String> getAddressFromLatLng(double latitude, double longitude, BuildContext context) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(latitude, longitude);
      if (placeMarks.isNotEmpty) {
        Placemark place = placeMarks[0];
        return "${place.street}, ${place.locality}, ${place.country}";
      }
    } catch (e) {
    }
    return AppLocalizations.of(context)!.address_not_found;
  }
}
