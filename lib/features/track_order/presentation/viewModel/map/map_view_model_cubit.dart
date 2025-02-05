import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
part 'map_view_model_state.dart';



class MapViewModelCubit extends Cubit<MapViewModelState> {
  MapViewModelCubit() : super(MapViewModelInitial());

  final PolylinePoints polylinePoints = PolylinePoints();
  final String googleApiKey = "AIzaSyCrWlfEnk9MKGLcWkW8ynjsHisHYZwi7xo";
  GoogleMapController? mapController;
  BitmapDescriptor? currentLocationIcon;
  BitmapDescriptor? destinationIcon;
  TextEditingController destinationController = TextEditingController();

  Future<void> loadCustomIcons() async {
    try {
      currentLocationIcon = await _getCustomIcon('assets/images/ApartmentLocation.png');
      destinationIcon = await _getCustomIcon('assets/images/FloweryLocation.png');
    } catch (e) {
      emit(MapError(message: 'Error loading icons: $e'));
    }
  }

  Future<BitmapDescriptor> _getCustomIcon(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    final Uint8List bytes = data.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(bytes);
  }

  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(MapError(message: 'Please enable location services'));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          emit(MapError(message: 'Location permission denied'));
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      LatLng currentLocation = LatLng(position.latitude, position.longitude);
      emit(MapLoaded(currentLocation: currentLocation));
    } catch (e) {
      emit(MapError(message: 'Error getting current location: $e'));
    }
  }

  Future<void> getDirections(LatLng currentLocation, LatLng destination) async {
    try {
      final response = await http.get(Uri.parse(
          'https://maps.googleapis.com/maps/api/directions/json?'
              'origin=${currentLocation.latitude},${currentLocation.longitude}'
              '&destination=${destination.latitude},${destination.longitude}'
              '&key=$googleApiKey'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        if (data['routes'].isEmpty) {
          emit(MapError(message: 'No route available'));
          return;
        }

        List<PointLatLng> points = polylinePoints
            .decodePolyline(data['routes'][0]['overview_polyline']['points']);

        emit(MapDirectionsLoaded(
          polylines: points.map((point) => LatLng(point.latitude, point.longitude)).toList(),
        ));
      }
    } catch (e) {
      emit(MapError(message: 'Error getting directions: $e'));
    }
  }

  Future<void> searchDestination(String destination) async {
    try {
      List<Location> locations = await locationFromAddress(destination);
      if (locations.isEmpty) {
        emit(MapError(message: 'Address not found'));
        return;
      }

      LatLng destinationLatLng = LatLng(locations[0].latitude, locations[0].longitude);
      final currentState = state;
      if (currentState is MapLoaded) {
        await getDirections(currentState.currentLocation, destinationLatLng);
      }
    } catch (e) {
      emit(MapError(message: 'Error searching destination: $e'));
    }
  }
}