// ignore_for_file: use_build_context_synchronously

import 'package:flowery_store/core/localization/lang_keys.dart';
import 'package:flowery_store/core/utils/extension/media_query_values.dart';
import 'package:flowery_store/flowery_store.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:location/location.dart';
class LocationHelper {
  LocationHelper._();
  static final LocationHelper _instance = LocationHelper._();
  factory LocationHelper() {
    return _instance;
  }

  BuildContext? get context => navigatorKey.currentState?.context;
  LocationData? myLocation;
  double latitude =0.0;
  double longitude = 0.0;
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

  Future<LocationPermission> requestLocationPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      return permission;
    } catch (e) {
      throw Exception(context?.translate(LangKeys.failure));
    }
  }

  Future<Position> getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(),
      );
  longitude=    position.longitude;
  latitude=    position.latitude;
      return position;
    } catch (e) {
      throw Exception(context?.translate(LangKeys.failure));
    }
  }

  Future<String?> getAddressFromLatLng(double latitude, double longitude, ) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(latitude, longitude);
      if (placeMarks.isNotEmpty) {
        Placemark place = placeMarks[0];
        return "${place.street}, ${place.locality}, ${place.country}";
      }
    } catch (e) {
      debugPrint('$e');
    }
    return context?.translate(LangKeys.addressNotFound);
  }
}