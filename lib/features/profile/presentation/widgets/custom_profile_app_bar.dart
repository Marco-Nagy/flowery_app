import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/utils/widgets/base/custom_app_bar.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomAppBar(appBarTxt: "Edit Profile", showArrow: true),
        badges.Badge(
          badgeContent: const Text(
            ' ',
            style: TextStyle(color: Colors.white),
          ),
          position: badges.BadgePosition.topEnd(top: -10.h, end: -2.w),
          child: const Icon(
            Icons.notifications,
            size: 30,
            color: MyColors.gray,
          ),
        ),
      ],
    );
  }
}
