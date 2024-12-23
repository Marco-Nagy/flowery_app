import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      emit(LocationError(AppLocalizations.of(context)!.error_getting_location));
    }
  }

  Future<void> detectLocation(BuildContext context) async {
    emit(LocationLoading());
    try {
      bool isServiceEnabled = await locationHelper.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        emit(LocationError(AppLocalizations.of(context)!.location_services_are_disabled));
        return;
      }

      LocationPermission permission = await locationHelper.requestLocationPermission(context);
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        emit(LocationError(AppLocalizations.of(context)!.location_permission_denied));
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
      emit(LocationError(AppLocalizations.of(context)!.error_getting_location));
    }
  }
}
