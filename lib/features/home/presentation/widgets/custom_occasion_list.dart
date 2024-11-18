


import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOccasionList extends StatefulWidget {
  const CustomOccasionList({super.key});

  @override
  State<CustomOccasionList> createState() => CustomOccasionListState();
}

class CustomOccasionListState extends State<CustomOccasionList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/occasion.png',
                  // width: 35.w,
                  // height: 35.h,
                ),
                SizedBox(height: 8.h,),
                Text('Wedding',style: MyFonts.styleMedium500_14.copyWith(color: MyColors.blackBase)),
              ],
            ),
          );
        },
      ),
    );
  }
}
