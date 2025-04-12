  import 'package:flowery_store/core/localization/lang_keys.dart';
import 'package:flowery_store/core/routes/app_routes.dart';
import 'package:flowery_store/core/styles/colors/my_colors.dart';
import 'package:flowery_store/core/utils/extension/media_query_values.dart';
import 'package:flowery_store/core/utils/extension/navigation.dart';
import 'package:flowery_store/core/utils/extension/string_exetension.dart';
import 'package:flowery_store/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_store/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_store/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_store/core/utils/widgets/spacing.dart';
import 'package:flowery_store/features/track_order/presentation/viewModel/track_order/track_order_view_model_cubit.dart';
import 'package:flowery_store/features/track_order/presentation/widgets/address_section.dart';
import 'package:flowery_store/features/track_order/presentation/widgets/order_status_card.dart';
import 'package:flowery_store/features/track_order/presentation/widgets/stepper_indicator.dart';
import 'package:flowery_store/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../viewModel/track_order/track_order_actions.dart';

  class TrackOrderScreen extends StatefulWidget {
    final String userId;
    final String orderId;

    const TrackOrderScreen({
      super.key,
      required this.userId,
      required this.orderId,
    });

    @override
    State<TrackOrderScreen> createState() => _TrackOrderScreenState();
  }

  class _TrackOrderScreenState extends State<TrackOrderScreen> {
    bool didInitTracking = false;
    late final TrackOrderViewModelCubit cubit;

    @override
    void initState() {
      super.initState();
      cubit = context.read<TrackOrderViewModelCubit>();
      debugPrint("📦 TrackOrderViewModelCubit initialized in TrackOrderScreen");
      cubit.doAction(GetOrderDetails(orderId: widget.orderId, userId: widget.userId));
    }

    @override
    Widget build(BuildContext context) {
      return BlocListener<TrackOrderViewModelCubit, TrackOrderViewModelState>(
        listener: (context, state) {
          if (state is GetTrackOrderSuccess && !didInitTracking) {
            debugPrint("✅ Order fetched successfully");
            final driver = cubit.trackOrderEntity?.driver;
            if (driver?.location != null) {
              debugPrint("📍 Driver location available. Starting simulation...");
              cubit.doAction(UpdateMapLocation(
                driverLat: driver!.location!.latitude,
                driverLng: driver.location!.longitude,
              ));
              didInitTracking = true;
            } else {
              debugPrint("⚠️ Driver location is NULL!");
            }
          }
        },
        child: BlocBuilder<TrackOrderViewModelCubit, TrackOrderViewModelState>(
          builder: (context, state) {
            if (state is TrackOrderViewModelLoading) {
              return const Center(child: AppLoader());
            }

            final entity = cubit.trackOrderEntity;
            final order = entity?.orders;
            final driver = entity?.driver;


            return Scaffold(
              appBar: customAppBar(
                appBarTxt: context.translate(LangKeys.trackOrder),
                context: context,
                showArrow: true,
              ),
              backgroundColor: MyColors.white,
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderStatusCard(
                        status: order?.state ?? '',
                        orderId: order?.orderNumber ?? '',
                        date: order?.updatedAt ?? '',
                      ),
                      verticalSpacing(20),
                      Center(
                        child: SvgPicture.asset(
                          Assets.imagesCar,
                          width: 210.w,
                          height: 80.h,
                        ),
                      ),
                      verticalSpacing(16),
                      if (driver != null)
                        AddressSection(
                          title: 'Pickup address',
                          name: '${driver.firstName} ${driver.lastName}',
                          address: context.translate(LangKeys.deliveryHeroToday),
                          image: driver.photo?.imageFormat() ?? '',
                          phone: driver.phone ?? '',
                        ),
                      verticalSpacing(16),
                      StepperIndicator(currentStep: cubit.currentStep),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CurvedButton(
                  title: context.translate(LangKeys.showMap),
                  onTap: () {
                    if (entity != null) {
                      debugPrint("🗺 Navigating to map screen with entity: ${entity.orders?.orderNumber}");
                      context.pushNamed(AppRoutes.trackOrderMap, arguments: entity);
                    } else {
                      debugPrint("❗ Entity is null. Can't navigate to map.");
                    }
                  },
                ),
              ),
            );
          },
        ),
      );
    }
  }


