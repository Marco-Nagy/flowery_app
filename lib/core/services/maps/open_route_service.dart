// lib/core/services/maps/open_route_service.dart
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OpenRouteService {
  static const String _baseUrl = 'https://api.openrouteservice.org/v2/directions/driving-car';
  static final String? _apiKey = dotenv.env['OPEN_ROUTE_API_KEY'];

  Future<List<LatLng>> getRouteCoordinates({
    required LatLng start,
    required LatLng end,
  }) async {
    final url = Uri.parse('$_baseUrl?api_key=$_apiKey&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to get route: ${response.body}');
    }

    final data = json.decode(response.body);
    final coordinates = data['features'][0]['geometry']['coordinates'] as List;

    return coordinates
        .map<LatLng>((coord) => LatLng(coord[1], coord[0]))
        .toList();
  }

  Future<double> getDistanceInKm({
    required LatLng start,
    required LatLng end,
  }) async {
    final url = Uri.parse('$_baseUrl?api_key=$_apiKey&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to get distance: ${response.body}');
    }

    final data = json.decode(response.body);
    final distanceInMeters = data['features'][0]['properties']['segments'][0]['distance'];

    return distanceInMeters / 1000; // Convert to KM
  }
}
