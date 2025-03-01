import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../localization/lang_keys.dart';

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


  Future<DataResult<LocationPermission>> requestLocationPermission(BuildContext context) async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Fail( Exception(context.translate('LangKeys.locationServicesDisabled')));
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
           return Fail(Exception(context.translate('LangKeys.permissionDenied')));
        }
      }

      if (permission == LocationPermission.deniedForever) {


        throw Fail(Exception(context.translate('LangKeys.permissionDeniedForever')));
      }

      return Success(permission);
    } catch (e) {

      return Fail(Exception(context.translate(LangKeys.failure)));
    }
  }


  Future<Position> getCurrentLocation(BuildContext context) async {
    try {
      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.best,
        ),
      );
    } catch (e) {
      throw Exception(context.translate(LangKeys.failure));
    }
  }

  Future<String> getAddressFromLatLng(
      double latitude, double longitude, BuildContext context) async {
    try {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placeMarks.isNotEmpty) {
        Placemark place = placeMarks[0];
        return "${place.street}, ${place.locality}, ${place.country}";
      }
    } catch (e) {}
    return (context.translate(LangKeys.addressNotFound));
  }
}
