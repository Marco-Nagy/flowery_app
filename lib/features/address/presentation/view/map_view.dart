import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as loc;

import 'package:geocoding/geocoding.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with TickerProviderStateMixin {
  final MapController mapController = MapController();
  loc.LocationData? currentLocation;
  LatLng? selectedLocation;
  String? address;
  String? city;
  String? country;
  bool isLoading = false;

  Future<void> _getCurrentLocation() async {
    loc.Location location = loc.Location();
    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentLocation = userLocation;
        selectedLocation = LatLng(
          userLocation.latitude!,
          userLocation.longitude!,
        );
        _getAddressFromLatLng(selectedLocation!);
      });
    } catch (e) {
      currentLocation = null;
    }
  }

  Future<void> _getAddressFromLatLng(LatLng latLng) async {
    setState(() => isLoading = true);
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        debugPrint("Placemark: $place");

        setState(() {
          // Extract the necessary fields
          address = "${place.subLocality}";
          city = place.locality ?? 'Unknown City';
          country = place.country ?? 'Unknown Country';

          // Assigning Administrative area and Subadministrative area to city and address
          String administrativeArea =
              place.administrativeArea ?? 'Unknown Area';
          String subAdministrativeArea =
              place.subAdministrativeArea ?? 'Unknown Sub Area';

          // You can decide how to combine these based on your needs
          city = "$city, $subAdministrativeArea";
          address = "$address$administrativeArea";

          isLoading = false;
        });
      } else {
        debugPrint("No placemarks found");
      }
    } catch (e) {
      debugPrint("Error retrieving address: $e");
      setState(() => isLoading = false);
    }
  }

  void _updateMarkerPosition(LatLng point) {
    setState(() {
      selectedLocation = point;
      _getAddressFromLatLng(point);
    });
  }

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  void _confirmLocation() {
    if (selectedLocation != null) {
      Navigator.pop(
        context,
        {
          'address': address ?? '',
          'city': city ?? '',
          'country': country ?? '',
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.95),
        elevation: 3,
        centerTitle: true,
        title: Text(
          "Map View",
          style: MyFonts.styleRegular400_20.copyWith(
            color: MyColors.baseColor,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(50),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: MyColors.baseColor,
              size: 22.sp,
            ),
          ),
        ),
      ),
      body: currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    initialCenter: LatLng(
                      currentLocation!.latitude!,
                      currentLocation!.longitude!,
                    ),
                    initialZoom: 12.0,
                    onTap: (tapPosition, point) => _updateMarkerPosition(point),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    if (selectedLocation != null)
                      MarkerLayer(
                        markers: [
                          Marker(
                            width: 80.w,
                            height: 80.h,
                            point: selectedLocation!,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 45.w,
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          MyColors.baseColor.withOpacity(0.3),
                                    ),
                                  ),
                                  Container(
                                    width: 22.w,
                                    height: 22.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: MyColors.baseColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: MyColors.baseColor
                                              .withOpacity(0.6),
                                          blurRadius: 8,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                Positioned(
                  bottom: 20.h,
                  right: 20.w,
                  child: FloatingActionButton(
                    onPressed: () {
                      if (currentLocation != null) {
                        mapController.move(
                          LatLng(currentLocation!.latitude!,
                              currentLocation!.longitude!),
                          15.0,
                        );
                        _updateMarkerPosition(LatLng(
                          currentLocation!.latitude!,
                          currentLocation!.longitude!,
                        ));
                      }
                    },
                    backgroundColor: MyColors.baseColor,
                    child: const Icon(Icons.my_location, color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 20.h,
                  left: 20.w,
                  child: ElevatedButton(
                    onPressed: _confirmLocation,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.baseColor,
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 20.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Confirm Location",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ],
            ),
    );
  }
}
