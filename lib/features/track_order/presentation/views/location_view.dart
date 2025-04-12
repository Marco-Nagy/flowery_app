import 'package:animate_do/animate_do.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flowery_store/core/localization/lang_keys.dart';
import 'package:flowery_store/core/styles/colors/my_colors.dart';
import 'package:flowery_store/core/styles/fonts/my_fonts.dart';
import 'package:flowery_store/core/utils/extension/media_query_values.dart';
import 'package:flowery_store/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_store/features/track_order/presentation/viewModel/track_order/track_order_view_model_cubit.dart';
import 'package:flowery_store/features/track_order/presentation/widgets/address_section.dart';
import 'package:flowery_store/features/track_order/presentation/widgets/delivery_location.dart';
import 'package:flowery_store/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/utils/widgets/base/snack_bar.dart';
import '../widgets/arrow_back_button.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  @override
  void initState() {
    super.initState();
    debugPrint('[🚁 initState] LocationView initialized');
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TrackOrderViewModelCubit>();
    final driver = viewModel.trackOrderEntity?.driver;
    final order = viewModel.trackOrderEntity?.orders;

    debugPrint(
        '[🚁 build] Rebuilding LocationView with driverLatLng: ${viewModel.driverLatLng}');

    return Stack(
      children: [
        BlocConsumer<TrackOrderViewModelCubit, TrackOrderViewModelState>(
          listener: (context, state) {
            if (state is TrackOrderViewModelError) {
              aweSnackBar(
                msg: state.errorModel.error.toString(),
                context: context,
                type: MessageTypeConst.failure,
                title: 'Error',
              );
            }
            if ( state is GetTrackOrderSuccess) {
              if (viewModel.driverLatLng == null) {
                viewModel.stream.map((event) {

                },);
              }

            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomGoogleMapMarkerBuilder(
                    customMarkers: [
                      MarkerData(
                        marker: Marker(
                          markerId: const MarkerId('destination'),
                          position: viewModel.destinationLatLng,
                        ),
                        child: const DeliveryLocation(
                          color: MyColors.baseColor,
                          icon: Icon(Icons.home_outlined,
                              color: MyColors.baseColor),
                          isDestination: false,
                          title: 'User Location',
                        ),
                      ),
                      MarkerData(
                        marker: Marker(
                          markerId: const MarkerId('source'),
                          position: viewModel.sourceLatLng,
                        ),
                        child:  DeliveryLocation(
                          color: MyColors.baseColor,
                          icon: Image.asset( Assets.imagesSplash,),
                          title: 'Flowery Store',
                        ),
                      ),
                        MarkerData(
                          marker: Marker(
                            markerId: const MarkerId('driver'),
                            position: viewModel.driverLatLng,
                            anchor: const Offset(0.5, 0.5),
                            rotation: TrackOrderViewModelCubit.calculateDegrees(
                              viewModel.driverLatLng,
                              viewModel.destinationLatLng,
                            ),
                          ),
                          child: FadeInDown(
                            duration: const Duration(seconds: 1),
                            child: Image.asset(
                              Assets.imagesMotorcycleDelivery,
                              width: 30.w,
                              height: 30.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                    ],
                    builder: (context, markers) {
                      return GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: viewModel.driverLatLng,
                          zoom: 14.0,
                        ),
                        mapType: MapType.normal,
                        markers: markers ?? {},
                        polylines: viewModel.polyLinesSet,
                        onMapCreated: (controller) {
                          if (!viewModel.mapController.isCompleted) {
                            viewModel.mapController.complete(controller);
                            debugPrint('🗺️ Map controller completed');
                            viewModel.onMapReady(); // ← HERE
                          } else {
                            debugPrint('⚠️ Map controller already completed');
                          }
                        },

                        zoomControlsEnabled: true,
                        zoomGesturesEnabled: true,
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24.h),
                            Text(
                              context.translate(LangKeys.estimatedArrival),
                              style: MyFonts.styleMedium500_14
                                  .copyWith(color: MyColors.gray),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              order?.updatedAt ?? "03 Sep 2024, 11:00 AM",
                              style: MyFonts.styleMedium500_16,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      const Divider(color: MyColors.placeHolder),
                      SizedBox(height: 10.h),
                      AddressSection(
                        title: context.translate(LangKeys.PickupAddress),
                        name:
                            '${driver?.firstName ?? 'null'} ${driver?.lastName ?? 'null'}',
                        address: context.translate(LangKeys.deliveryHeroToday),
                        image: (driver?.photo?.isNotEmpty ?? false)
                            ? driver!.photo!
                            : '',
                        phone: driver?.phone ?? '',
                      ),
                      SizedBox(height: 40.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CurvedButton(
                          title: context.translate(LangKeys.orderDetails),
                          onTap: () {
                            // Handle order details navigation
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        Positioned(
          top: 40.h,
          left: 16.w,
          child: const ArrowBackButton(),
        ),
      ],
    );
  }
}
