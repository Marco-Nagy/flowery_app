import 'package:flowery_e_commerce/features/cart/presentation/widgets/plus_minus_buttons.dart';
import 'package:flowery_e_commerce/features/generic/presentation/widgets/cached_network_widget.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.name, required this.image});

 final String name;
 final String image;
  @override
  Widget build(BuildContext context) {
    return  Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(8),
      elevation: 5.0,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: MyColors.white70),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 10.h,
              width: 96.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8)
              ),
              child: CachedNetworkWidget(
                  imageUrl: image
              ),
            ),
            horizontalSpacing(8.w),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            name,
                            style: MyFonts.styleMedium500_16.copyWith(color: MyColors.black),
                          ),
                          Text(
                            name,
                            style: MyFonts.styleRegular400_13.copyWith(color: MyColors.gray),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(Assets.imagesDelete)
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: MyFonts.styleMedium500_16.copyWith(color: MyColors.black),
                      ),
                    ),
                    PlusMinusButtons(addQuantity: () {

                    }, deleteQuantity: () {

                    }, text: '1')
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
