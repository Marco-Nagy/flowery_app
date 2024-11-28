import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../generated/assets.dart';

Widget ArrowBackWidget(BuildContext context) {
  return Positioned(
      top: 50.h,
      left: 16.w,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Image.asset(
          Assets.imagesArrowBackIos,
          height: 24.h,
          width: 24.w,
          color: MyColors.black,
        ),
      ));
}
