import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/buttons/row_button.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../../../../generated/assets.dart';
import 'cached_network_widget.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({super.key});

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
          CachedNetworkWidget(
              imageUrl: Assets.imagesFlower
          ),
          verticalSpacing(8.h),
          Align(
            alignment: Alignment.centerLeft,
            widthFactor: 1.7,
            child: Text(
              'Product Name',
              style: MyFonts.styleRegular400_14.copyWith(color: MyColors.black),
            ),
          ),
          verticalSpacing(6.h),
          RichText(
            text: TextSpan(
              text: 'EGP 600',
              style: MyFonts.styleMedium500_14.copyWith(color: MyColors.black),
              children: [
                WidgetSpan(child: horizontalSpacing(5.w)),
                TextSpan(
                  text: '800',
                  style: MyFonts.styleRegular400_12.copyWith(
                    color: MyColors.gray,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                WidgetSpan(child: horizontalSpacing(5.w)),
                TextSpan(
                  text: '20%',
                  style: MyFonts.styleRegular400_12.copyWith(color: MyColors.green),
                ),
              ],
            ),
          ),
          verticalSpacing(11.h),
         Spacer(),
          Align(
              alignment: Alignment.bottomCenter,
              child: RowButton(onTap: () {})),
        ],
      ),
    );
  }
}
