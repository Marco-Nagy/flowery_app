import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../generated/assets.dart';

class CustomFilterCategories extends StatelessWidget {
  const CustomFilterCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.placeHolder),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Image(
          image: AssetImage(Assets.imagesFilter),
          color: MyColors.placeHolder,
          height: 12.h,
          width: 18.w,
        ),
      ),
    );
  }
}
