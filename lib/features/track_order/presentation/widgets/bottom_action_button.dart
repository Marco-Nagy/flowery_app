import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomActionButton extends StatelessWidget {

  const BottomActionButton(
      {super.key,
    required this.statusTxt,
    this.containerClr,
    this.borderClr,
    this.textColor, required this.onPressed,});

  final String statusTxt;
  final Color? containerClr, borderClr, textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: containerClr ?? MyColors.white,
          border: Border.all(color: borderClr ?? MyColors.baseColor),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          child: Text(
            statusTxt,
            style: MyFonts.styleMedium500_14
                .copyWith(color: textColor ?? MyColors.baseColor),
          ),
        ),
      ),
    );
  }
}