import 'package:badges/badges.dart' as badges;
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarOfProfileMainScreen extends StatelessWidget {
  const CustomAppBarOfProfileMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.sp, right: 16.sp),
      child: Wrap(
        spacing: 220.sp,
        children: [
          SizedBox(
              width: 89.w,
              height: 25.h,
              child: Image.asset(
                Assets.imagesLogo,
                width: 98.w,
                height: 25.h,
                fit: BoxFit.fitWidth,
              )),
          badges.Badge(
            badgeContent: Text(
              '3',
              style: MyFonts.styleMedium500_11.copyWith(
                color: MyColors.whiteBase,
              ),
            ),
            position: badges.BadgePosition.topEnd(top: -10.h, end: -2.w),
            child: Icon(
              Icons.notifications,
              size: 30.sp,
            ),
          ),
        ],
      ),
    );
  }
}
