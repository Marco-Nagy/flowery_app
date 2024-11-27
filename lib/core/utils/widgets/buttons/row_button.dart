import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../spacing.dart';


class RowButton extends StatelessWidget {
  const RowButton({
    super.key,
    required this.onTap,
    required this.widgetKey,
  });


  final void Function(GlobalKey) onTap ;
  final GlobalKey widgetKey ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:40.h,
      width:double.infinity,
      child: ElevatedButton(
        onPressed: () => onTap(widgetKey),
        style: ElevatedButton.styleFrom(
          padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 24.w),
          backgroundColor: MyColors.baseColor ,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.shopping_cart_outlined,color: MyColors.white,size: 19,),
            horizontalSpacing(8.w),
            Text(
              'Add to cart',
              style: MyFonts.styleMedium500_13
                  .copyWith(color: MyColors.white),
            ),
          ],
        ),
      ),
    );
  }
}