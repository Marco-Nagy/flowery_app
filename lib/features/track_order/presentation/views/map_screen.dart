import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/buttons/carved_button.dart';
import '../../domain/entities/track_order_entity.dart';
import '../viewModel/map/map_view_model_cubit.dart';
import '../widgets/address_section.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  Future<Map<String, BitmapDescriptor>> _loadMarkerIcons() async {
    final userIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(60, 60)),
      'assets/images/ApartmentLocation.png',
    );
    final storeIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(60, 60)),
      'assets/images/FloweryLocation.png',
    );
    final driverIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(60, 60)),
      'assets/images/delivery.png',
    );
    return {
      'user': userIcon,
      'store': storeIcon,
      'driver': driverIcon,
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapViewModelCubit, MapViewModelState>(
      builder: (context, state) {
        final orderViewModelCubit = context.read<MapViewModelCubit>();
        if (state is TrackOrderViewModelLoading) {
          return const Center(child: AppLoader());
        } else {
          final order = orderViewModelCubit.trackOrderEntity!.orders;
          final drive = orderViewModelCubit.trackOrderEntity!.driver;

          return Scaffold(
            backgroundColor: MyColors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<Map<String, BitmapDescriptor>>(
                    future: _loadMarkerIcons(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const AppLoader();
                      }
                      final icons = snapshot.data!;
                      return Container(
                        height: 500.h,
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: _calculateCenter(
                              userLat: order!.user!.location!.latitude,
                              userLng: order.user!.location!.longitude,
                              storeLat: order.store!.latitude,
                              storeLng: order.store!.longitude,
                              driverLat: drive!.location!.latitude,
                              driverLng: drive.location!.longitude,
                            ),
                            zoom: 14,
                          ),
                          markers: _buildMarkers(order, drive, icons),
                          polylines: _buildPolylines(order, drive),
                          onMapCreated: (controller) =>
                              _adjustCameraToFitMarkers(
                                  controller, order, drive),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.h),
                        Text(context.translate(LangKeys.estimatedArrival),
                            style: MyFonts.styleMedium500_14.copyWith(
                              color: MyColors.gray,
                            )),
                        SizedBox(height: 8.h),
                        Text(order!.updatedAt ?? "03 Sep 2024, 11:00 AM",
                            style: MyFonts.styleMedium500_16),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const Divider(color: MyColors.placeHolder),
                  SizedBox(height: 10.h),
                  AddressSection(
                    title: context.translate(LangKeys.PickupAddress),
                    name: '${order.user!.firstName} ${order.user!.lastName}',
                    address: context.translate(LangKeys.deliveryHeroToday),
                    image: order.user!.photo ?? '',
                    phone: order.user!.phone!,
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CurvedButton(
                      title: context.translate(LangKeys.orderDetails),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Set<Marker> _buildMarkers(
      OrderData order, Driver drive, Map<String, BitmapDescriptor> icons) {
    return {
      Marker(
        markerId: const MarkerId('user'),
        position: LatLng(
          order.user!.location!.latitude,
          order.user!.location!.longitude,
        ),
        icon: icons['user']!,
        infoWindow: const InfoWindow(title: 'User Location'),
      ),
      Marker(
        markerId: const MarkerId('store'),
        position: LatLng(
          order.store!.latitude,
          order.store!.longitude,
        ),
        icon: icons['store']!,
        infoWindow: const InfoWindow(title: 'Store'),
      ),
      Marker(
        markerId: const MarkerId('driver'),
        position: LatLng(
          drive.location?.latitude ?? 30.0566,
          drive.location?.longitude ?? 31.3301,
        ),
        icon: icons['driver']!,
        infoWindow: InfoWindow(title: 'driver: ${drive.lastName}'),
      ),
    };
  }

  Set<Polyline> _buildPolylines(OrderData order, Driver driver) {
    return {
      Polyline(
        polylineId: const PolylineId('route'),
        color: MyColors.baseColor,
        width: 4,
        points: [
          LatLng(
            order.user!.location!.latitude,
            order.user!.location!.longitude,
          ),
          LatLng(
            order.store!.latitude,
            order.store!.longitude,
          ),
          LatLng(
            driver.location!.latitude,
            driver.location!.longitude,
          ),
        ],
      ),
    };
  }

  LatLng _calculateCenter({
    required double userLat,
    required double userLng,
    required double storeLat,
    required double storeLng,
    required double driverLat,
    required double driverLng,
  }) {
    return LatLng(
      (userLat + storeLat + driverLat) / 3,
      (userLng + storeLng + driverLng) / 3,
    );
  }

  Future<void> _adjustCameraToFitMarkers(
    GoogleMapController controller,
    OrderData order,
    Driver driver,
  ) async {
    final bounds = LatLngBounds(
      southwest: LatLng(
        _min(
          order.user!.location!.latitude,
          order.store!.latitude,
          driver.location!.latitude,
        ),
        _min(
          order.user!.location!.longitude,
          order.store!.longitude,
          driver.location!.longitude,
        ),
      ),
      northeast: LatLng(
        _max(
          order.user!.location!.latitude,
          order.store!.latitude,
          driver.location!.latitude,
        ),
        _max(
          order.user!.location!.longitude,
          order.store!.longitude,
          driver.location!.longitude,
        ),
      ),
    );

    await controller.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 100),
    );
  }

  double _min(double a, double b, double c) => [a, b, c].reduce(math.min);

  double _max(double a, double b, double c) => [a, b, c].reduce(math.max);
}
