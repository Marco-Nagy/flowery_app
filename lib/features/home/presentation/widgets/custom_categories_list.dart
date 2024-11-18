import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoriesList extends StatefulWidget {
  const CustomCategoriesList({super.key});

  @override
  State<CustomCategoriesList> createState() => _CustomCategoriesListState();
}

class _CustomCategoriesListState extends State<CustomCategoriesList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.all(5.sp),
                height: 89.h,
                width: 89.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: MyColors.lightPink,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/tulip.png',
                    width: 35.w,
                    height: 35.h,
                  ),
                ),
              ),
              SizedBox(height: 8.h,),
              Text('Flowers',style:MyFonts.styleRegular400_14.copyWith(color: MyColors.blackBase)),
            ],
          );
        },
      ),
    );
  }
}
