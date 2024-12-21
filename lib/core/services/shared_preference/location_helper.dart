import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationHelper {
  Future<void> saveLocation(String location) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('location', location);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getSavedLocation() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('location');
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

  Future<LocationPermission> requestLocationPermission(BuildContext context) async {
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

  Future<Position> getCurrentLocation(BuildContext context) async {
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