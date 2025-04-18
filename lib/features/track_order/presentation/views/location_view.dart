import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flowery_store/core/localization/lang_keys.dart';
import 'package:flowery_store/core/routes/app_routes.dart';
import 'package:flowery_store/core/styles/colors/my_colors.dart';
import 'package:flowery_store/core/utils/extension/media_query_values.dart';
import 'package:flowery_store/core/utils/extension/navigation.dart';
import 'package:flowery_store/core/utils/extension/string_exetension.dart';
import 'package:flowery_store/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_store/di/di.dart';
import 'package:flowery_store/features/track_order/domain/entities/track_order_entity.dart';
import 'package:flowery_store/features/track_order/presentation/viewModel/track_order/track_order_actions.dart';
import 'package:flowery_store/features/track_order/presentation/viewModel/track_order/track_order_view_model_cubit.dart';
import 'package:flowery_store/features/track_order/presentation/viewModel/update_driver_location_provider.dart';
import 'package:flowery_store/features/track_order/presentation/widgets/address_section.dart';
import 'package:flowery_store/features/track_order/presentation/widgets/delivery_location.dart';
import 'package:flowery_store/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../widgets/arrow_back_button.dart';

class LocationView extends StatefulWidget {
  final TrackOrderEntity trackOrderEntity;

  const LocationView({
    super.key,
    required this.trackOrderEntity,
  });

  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  late final TrackOrderViewModelCubit viewModel;
  late final UpdateDriverLocationProvider locationProvider;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    viewModel = await getIt<TrackOrderViewModelCubit>();
    locationProvider = UpdateDriverLocationProvider(viewModel);

    await viewModel.doAction(
      GetOrderDetails(
        orderId: widget.trackOrderEntity.orders!.id!,
        userId: widget.trackOrderEntity.orders!.user!.id!,
      ),
    );

    // // ✅ استدعاء الاستماع لتحديث موقع السائق من Firestore


    if (mounted) {
      final driverLocation = viewModel.trackOrderEntity?.driver?.location;
      if (driverLocation != null) {
        locationProvider.getCurrentLocation(
          LatLng(driverLocation.latitude, driverLocation.longitude),

        );
        locationProvider.syncDriverLocationFromCubit();
      }

      setState(() => isInitialized = true);
    }
  }


  @override
  void dispose() {
    locationProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return const Scaffold(
        body: Center(
          child: SpinKitThreeInOut(
            color: MyColors.baseColor,
            size: 40.0,
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UpdateDriverLocationProvider>(
          create: (_) {
            final provider = UpdateDriverLocationProvider(viewModel);
            final driverLocation = viewModel.trackOrderEntity?.driver?.location;
            if (driverLocation != null) {
              provider.getCurrentLocation(
                LatLng(driverLocation.latitude, driverLocation.longitude),
              );
            }
            return provider;
          },
        ),
      ],
      child: Stack(
        children: [
          BlocListener<TrackOrderViewModelCubit, TrackOrderViewModelState>(
            bloc: viewModel,
            listener: (context, state) {


              if (state is GetTrackOrderSuccess) {
                final driverLocation = state.trackOrderEntity.driver?.location;
                if (driverLocation != null) {
                  locationProvider.getCurrentLocation(
                    LatLng(driverLocation.latitude, driverLocation.longitude),
                  );
                  locationProvider.syncDriverLocationFromCubit();

                }
              }
            },
            child: Consumer<UpdateDriverLocationProvider>(
              builder: (context, state, _) {
                // print("📌 driverLatLng from provider: ${state.driverLatLng}");
                if (state.driverLatLng == null) {

                return  const Center(
                    child: SpinKitThreeInOut(
                      color: MyColors.baseColor,
                      size: 40.0,
                    ),
                  );
                }

                return Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomGoogleMapMarkerBuilder(
                        customMarkers: [
                          MarkerData(
                            marker: Marker(
                              markerId: const MarkerId('user'),
                              position: state.destinationLatLng!,
                            ),
                            child: const DeliveryLocation(
                              color: MyColors.baseColor,
                              icon: Icon(Icons.home_outlined,
                                  color: MyColors.baseColor),
                              isDestination: false,
                              title: 'User',
                            ),
                          ),
                          if ( state.driverLatLng != null)
                          MarkerData(
                            marker: Marker(
                              markerId: const MarkerId('driver'),
                              position: state.driverLatLng!,
                              anchor: const Offset(0.5, 0.5),
                              rotation: state.carDegree,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                Assets.imagesMotorcycleDelivery,
                                width: 100.w,
                                height: 100.h,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ],
                        builder: (context, markers) {
                          return GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: state.driverLatLng!,
                              zoom: 14.0,
                            ),
                            mapType: MapType.normal,
                            markers: markers ?? {},
                            polylines: state.polyLinesSet,
                            onMapCreated:
                                (GoogleMapController mapController) async {
                              if (!state.mapController.isCompleted) {
                                final controller =
                                await state.mapController.future;
                                await controller.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                      target: state.driverLatLng!,
                                      zoom: 14.5,
                                      tilt: 60,
                                      bearing: 50,
                                    ),
                                  ),
                                );
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
                      child: AddressSection(
                        title: context.translate(LangKeys.PickupAddress),
                        name:
                            '${state.viewModel.trackOrderEntity?.orders?.user?.firstName ?? ''} ${state.viewModel.trackOrderEntity?.orders?.user?.lastName ?? ''}',
                        address: context.translate(LangKeys.deliveryHeroToday),
                        image: state.viewModel.trackOrderEntity?.orders?.user
                                ?.photo?.toFullImageUrl ??
                            '',
                        phone: state.viewModel.trackOrderEntity?.orders?.user
                                ?.phone ??
                            '',
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CurvedButton(
                        title: context.translate(LangKeys.orderDetails),
                        onTap: () {
                          context.pushNamed(AppRoutes.orderView,
                              arguments: {
                                'userId':
                                    state.viewModel.trackOrderEntity?.orders?.user?.id,
                              });                      },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Positioned(
            top: 40.h,
            left: 16.w,
            child: const ArrowBackButton(),
          ),
        ],
      ),
    );
  }
}
