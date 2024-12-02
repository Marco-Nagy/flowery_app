import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../spacing.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({
    super.key,
    required this.onTap,
    this.showRow = true,
    this.height ,
  });

  final VoidCallback onTap;
  final bool showRow;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
          backgroundColor: MyColors.baseColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: showRow
            ? Row(
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: MyColors.white,
                    size: 19,
                  ),
                  horizontalSpacing(8.w),
                  AutoSizeText(
                    'Add to cart',
                    style: MyFonts.styleMedium500_13
                        .copyWith(color: MyColors.white),
                  ),
                ],
              )
            : Center(
                child: AutoSizeText(
                  'Add to cart',
                  style:
                      MyFonts.styleMedium500_16.copyWith(color: MyColors.white),
                ),
              ),
      ),
    );
  }
}
