import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/viewModel/generic_item_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../core/utils/widgets/buttons/row_button.dart';
import '../../../../../core/utils/widgets/spacing.dart';
import '../../../../generic/presentation/widgets/cached_network_widget.dart';

class GenericBuildItem extends StatelessWidget {
  GenericBuildItem(
      {super.key,
      required this.imageCover,
      required this.title,
      required this.price,
      required this.priceAfterDiscount});

  final String imageCover, title, price, priceAfterDiscount;
  final GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: MyColors.white70),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 140.h,
            child: CachedNetworkWidget(
              imageUrl: imageCover,
            ),
          ),
          verticalSpacing(8.h),
          Align(
            alignment: Alignment.center,
            widthFactor: 1.7,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: MyFonts.styleRegular400_14.copyWith(color: MyColors.black),
            ),
          ),
          verticalSpacing(6.h),
          RichText(
            text: TextSpan(
              text: 'EGP ${price}',
              style: MyFonts.styleMedium500_14.copyWith(color: MyColors.black),
              children: [
                WidgetSpan(child: horizontalSpacing(5.w)),
                TextSpan(
                  text: priceAfterDiscount,
                  style: MyFonts.styleRegular400_12.copyWith(
                    color: MyColors.gray,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                WidgetSpan(child: horizontalSpacing(5.w)),
                TextSpan(
                  text: '20%',
                  style: MyFonts.styleRegular400_12
                      .copyWith(color: MyColors.green),
                ),
              ],
            ),
          ),
          verticalSpacing(8.h),
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: 150.w,
                  child: RowButton(
                    onTap: (widgetKey) => context
                        .read<GenericItemViewModelCubit>()
                        .listClick(widgetKey),
                    widgetKey: widgetKey,
                  ))),
        ],
      ),
    );
  }
}
