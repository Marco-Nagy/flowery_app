import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/services/shared_preference/location_helper.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationHelper locationHelper;

  LocationCubit(this.locationHelper) : super(LocationInitial());

  Future<void> loadSavedLocation(BuildContext context) async {
    emit(LocationLoading());
    try {
      final savedLocation = await locationHelper.getSavedLocation();
      if (savedLocation != null && savedLocation.isNotEmpty) {
        emit(LocationLoaded(savedLocation));
      } else {
        emit(LocationNotAvailable());
      }
    } catch (e) {
      emit(LocationError(context.translate(LangKeys.errorGettingLocation)));
    }
  }

  Future<void> detectLocation(BuildContext context) async {
    emit(LocationLoading());
    try {
      bool isServiceEnabled = await locationHelper.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        emit(LocationError(context.translate(LangKeys.locationServicesAreDisabled)));
        return;
      }

      LocationPermission permission = await locationHelper.requestLocationPermission(context);
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        emit(LocationError(context.translate(LangKeys.locationPermissionDenied)));
        return;
      }

      final position = await locationHelper.getCurrentLocation(context);
      final address = await locationHelper.getAddressFromLatLng(
        position.latitude,
        position.longitude,
        context,
      );

      await locationHelper.saveLocation(address);
      emit(LocationLoaded(address));
    } catch (e) {
      emit(LocationError(context.translate(LangKeys.errorGettingLocation)));
    }
  }
}
