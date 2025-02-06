import 'package:flowery_e_commerce/core/localization/lang_keys.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/track_order/presentation/viewModel/track_order/track_order_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/track_order/presentation/widgets/address_section.dart';
import 'package:flowery_e_commerce/features/track_order/presentation/widgets/order_status_card.dart';
import 'package:flowery_e_commerce/features/track_order/presentation/widgets/stepper_indicator.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TrackOrderScreen extends StatefulWidget {
  final String userId;
  final String orderId;
  const TrackOrderScreen({
    super.key, required this.userId, required this.orderId,
  });

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    var orderViewModelCubit = context.read<TrackOrderViewModelCubit>();

    return BlocBuilder<TrackOrderViewModelCubit, TrackOrderViewModelState>(
      builder: (context, state) {
        if (state is TrackOrderViewModelLoading) {
          return const Center(child: AppLoader());
        } else {
          final order = orderViewModelCubit.trackOrderEntity!.orders;
          final drive = orderViewModelCubit.trackOrderEntity!.driver;
          return Scaffold(
            appBar: customAppBar(
              appBarTxt:context.translate(LangKeys.trackOrder),
              context: context,
              showArrow: true,
            ),
            backgroundColor: MyColors.white,
            body: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderStatusCard(
                          status: order!.state ?? '',
                          orderId: order.orderNumber ?? '',
                          date: order.updatedAt ?? ''),
                      verticalSpacing(20),
                      Center(
                        child: SvgPicture.asset(
                          Assets.imagesCar,
                          width: 210.w,
                          height: 80.h,
                        ),
                      ),
                      verticalSpacing(16),
                      if (drive != null)
                        AddressSection(
                          title: 'Pickup address',
                          name: '${drive.firstName} ${drive.lastName}',
                          address:context.translate(LangKeys.deliveryHeroToday),
                          image: drive.photo ?? '',
                          phone: drive.phone! ,
                        ),
                      verticalSpacing(16),
                       StepperIndicator(currentStep: orderViewModelCubit.currentStep)
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CurvedButton(
                title: context.translate(LangKeys.showMap),
                  onTap: () {}
,
              ),
            ),
          );
        }
      },
    );
  }
}
