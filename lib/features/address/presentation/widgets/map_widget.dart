import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../view_model/map_view_model.dart';

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapViewModel>(
      builder: (context, model, child) {
        if (model.currentLocation == null) {
          return const Center(
              child: SpinKitThreeInOut(
            color: MyColors.baseColor,
            size: 40.0,
          ));
        }

        return Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(
                  model.currentLocation!.latitude!,
                  model.currentLocation!.longitude!,
                ),
                initialZoom: 12.0,
                onTap: (tapPosition, point) {
                  model.updateMarkerPosition(point);
                },
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),
                if (model.selectedLocation != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 80.w,
                        height: 80.h,
                        point: model.selectedLocation!,
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
                                  color: Colors.blue.withOpacity(0.3),
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
                                      color: Colors.blue.withOpacity(0.6),
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
          ],
        );
      },
    );
  }
}
