

import 'dart:convert';
import 'dart:math';

import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart'as http;

import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/buttons/carved_button.dart';
import '../widgets/address_section.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.image,
  });
  final String name, phone, image;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late TextEditingController _destinationController;
  GoogleMapController? _mapController;
  LatLng? _currentLocation;
  LatLng? _destination;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();
   String googleApiKey = "AIzaSyCrWlfEnk9MKGLcWkW8ynjsHisHYZwi7xo";


  BitmapDescriptor? _currentLocationIcon;
  BitmapDescriptor? _destinationIcon;

  @override
  void initState() {
    super.initState();
    _destinationController = TextEditingController();
    _loadCustomIcons();
    _getCurrentLocation();
  }

  Future<void> _loadCustomIcons() async {
    try {
      _currentLocationIcon = await _getCustomIcon('assets/images/ApartmentLocation.png');
      _destinationIcon = await _getCustomIcon('assets/images/FloweryLocation.png');
    } catch (e) {
      debugPrint('Error loading icons: $e');
    }
  }

  Future<BitmapDescriptor> _getCustomIcon(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    final Uint8List bytes = data.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(bytes);
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enable location services')),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permission denied')),
          );
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        if (_currentLocationIcon != null) {
          _addMarker(_currentLocation!, "Current Location", _currentLocationIcon!);
        }
      });

      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_currentLocation!, 14),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error getting current location: $e')),
      );
    }
  }

  void _addMarker(LatLng position, String title, BitmapDescriptor icon) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(title),
        position: position,
        infoWindow: InfoWindow(title: title),
        icon: icon,
      ));
    });
  }

  Future<void> _getDirections() async {
    if (_currentLocation == null || _destination == null) return;

    try {
      final response = await http.get(Uri.parse(
          'https://maps.googleapis.com/maps/api/directions/json?'
              'origin=${_currentLocation!.latitude},${_currentLocation!.longitude}'
              '&destination=${_destination!.latitude},${_destination!.longitude}'
              '&key=$googleApiKey'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        if (data['routes'].isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No route available')),
          );
          return;
        }

        List<PointLatLng> points = polylinePoints
            .decodePolyline(data['routes'][0]['overview_polyline']['points']);

        setState(() {
          _polylines.add(Polyline(
            polylineId: const PolylineId('route'),
            points: points
                .map((point) => LatLng(point.latitude, point.longitude))
                .toList(),
            color: MyColors.baseColor,
            width: 5,
          ));
        });

        _mapController?.animateCamera(CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(
              min(_currentLocation!.latitude, _destination!.latitude),
              min(_currentLocation!.longitude, _destination!.longitude),
            ),
            northeast: LatLng(
              max(_currentLocation!.latitude, _destination!.latitude),
              max(_currentLocation!.longitude, _destination!.longitude),
            ),
          ),
          50,
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error getting directions: $e')),
      );
    }
  }

  Future<void> _onDestinationSubmitted() async {
    if (_destinationController.text.isEmpty) return;

    try {
      List<Location> locations =
      await locationFromAddress(_destinationController.text);
      if (locations.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Address not found')),
        );
        return;
      }

      if (_destinationIcon == null) return;

      setState(() {
        _destination = LatLng(locations[0].latitude, locations[0].longitude);
        _addMarker(_destination!, "Destination", _destinationIcon!);
      });

      await _getDirections();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error searching: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 450.h,
              width: double.infinity,
              child: _currentLocation == null
                  ? const Center(child: CircularProgressIndicator())
                  : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _currentLocation!,
                  zoom: 14,
                ),
                markers: _markers,
                polylines: _polylines,
                onMapCreated: (controller) => _mapController = controller,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _destinationController,
                    decoration: InputDecoration(
                      labelText: 'Enter Destination',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: _onDestinationSubmitted,
                      ),
                    ),
                    onSubmitted: (_) => _onDestinationSubmitted(),
                  ),
                  SizedBox(height: 24.h),
                  Text(context.translate(LangKeys.estimatedArrival),
                      style: MyFonts.styleMedium500_14.copyWith(
                        color: MyColors.gray,
                      )),
                  SizedBox(height: 8.h),
                  Text("03 Sep 2024, 11:00 AM", style: MyFonts.styleMedium500_16),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            const Divider(color: MyColors.placeHolder),
            SizedBox(height: 10.h),
            AddressSection(
              title: 'Pickup address',
              name: widget.name,
              address: context.translate(LangKeys.deliveryHeroToday),
              image: widget.image,
              phone: widget.phone,
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CurvedButton(
                title: context.translate(LangKeys.orderDetails),
                onTap: () {},
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _destinationController.dispose();
    super.dispose();
  }
}




















// class MapScreen extends StatelessWidget {
//   const MapScreen({
//     super.key,
//     required this.name,
//     required this.phone,
//     required this.image,
//   });
//   final String name, phone, image;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => MapViewModelCubit()
//         ..loadCustomIcons()
//         ..getCurrentLocation(),
//       child: Scaffold(
//         backgroundColor: MyColors.white,
//         body: BlocBuilder<MapViewModelCubit, MapViewModelState>(
//           builder: (context, state) {
//             if (state is MapViewModelInitial) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is MapLoaded || state is MapDirectionsLoaded) {
//               LatLng currentLocation;
//               List<LatLng> polylines = [];
//
//               if (state is MapLoaded) {
//                 currentLocation = state.currentLocation;
//               } else if (state is MapDirectionsLoaded) {
//                 final previousState = context.read<MapViewModelCubit>().state;
//                 if (previousState is MapLoaded) {
//                   currentLocation = previousState.currentLocation;
//                 } else {
//                   return const Center(child: Text("Location data unavailable"));
//                 }
//                 polylines = state.polylines;
//               } else {
//                 return const Center(child: CircularProgressIndicator());
//               }
//
//               return SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 450.h,
//                       width: double.infinity,
//                       child: GoogleMap(
//                         initialCameraPosition: CameraPosition(
//                           target: currentLocation,
//                           zoom: 14,
//                         ),
//                         markers: context.read<MapViewModelCubit>().currentLocationIcon != null
//                             ? {
//                                 Marker(
//                                   markerId: const MarkerId('currentLocation'),
//                                   position: currentLocation,
//                                   icon: context.read<MapViewModelCubit>().currentLocationIcon!,
//                                 ),
//                               }
//                             : {},
//                         polylines: {
//                           Polyline(
//                             polylineId: const PolylineId('route'),
//                             points: polylines,
//                             color: MyColors.baseColor,
//                             width: 5,
//                           ),
//                         },
//                         onMapCreated: (controller) => context.read<MapViewModelCubit>().mapController = controller,
//                         myLocationEnabled: true,
//                         myLocationButtonEnabled: true,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           TextField(
//                             controller: context.read<MapViewModelCubit>().destinationController,
//                             decoration: InputDecoration(
//                               labelText: 'Enter Destination',
//                               suffixIcon: IconButton(
//                                 icon: const Icon(Icons.search),
//                                 onPressed: () {
//                                   _onDestinationSubmitted(context);
//                                 },
//                               ),
//                             ),
//                             onSubmitted: (_) => _onDestinationSubmitted(context),
//                           ),
//                           SizedBox(height: 24.h),
//                           Text(context.translate(LangKeys.estimatedArrival),
//                               style: MyFonts.styleMedium500_14.copyWith(
//                                 color: MyColors.gray,
//                               )),
//                           SizedBox(height: 8.h),
//                           Text("03 Sep 2024, 11:00 AM", style: MyFonts.styleMedium500_16),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 16.h),
//                     const Divider(color: MyColors.placeHolder),
//                     SizedBox(height: 10.h),
//                     AddressSection(
//                       title: 'Pickup address',
//                       name: name,
//                       address: context.translate(LangKeys.deliveryHeroToday),
//                       image: image,
//                       phone: phone,
//                     ),
//                     SizedBox(height: 40.h),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: CurvedButton(
//                         title: context.translate(LangKeys.orderDetails),
//                         onTap: () {},
//                       ),
//                     ),
//                     SizedBox(height: 24.h),
//                   ],
//                 ),
//               );
//             } else if (state is MapError) {
//               return Center(child: Text(state.message));
//             } else {
//               return const Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   void _onDestinationSubmitted(BuildContext context) {
//     final cubit = context.read<MapViewModelCubit>();
//     final destination = cubit.destinationController.text;
//     if (destination.isNotEmpty) {
//       cubit.searchDestination(destination);
//     }
//   }
// }