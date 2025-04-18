import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';

class DeliveryLocation extends StatelessWidget {
  const DeliveryLocation(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      this.isDestination});

  final String title;
  final Widget icon;
  final Color color;
  final bool? isDestination;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only( right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(48),
        border: Border.all(
            color:
                isDestination ?? false ? MyColors.baseColor : MyColors.white),
      ),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 30.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.white,
            ),
              child: icon),
          Text(
            title,
            style: MyFonts.styleSemiBold600_14.copyWith(
              fontFamily: 'oronteus',
                color: isDestination ?? false
                    ? MyColors.baseColor
                    : MyColors.white),
          ),
        ],
      ),
    );
  }
}
