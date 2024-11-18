import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/custom_best_seller_list.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/custom_categories_list.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/custom_occasion_list.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/discover_something_list.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 89.w,
              height: 35.h,
            ),
            SizedBox(
              width: 20.w,
            ),
           SizedBox(
             width: 220.w,
               height: 50.h,
               child: SearchTextField()),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(15.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/location_on.png'),
                  Text('Deliver to 2XVP+XC - Sheikh Zayed ',style:MyFonts.styleMedium500_14.copyWith(color: MyColors.blackBase),),
                  Image.asset('assets/images/arrow_back_ios.png'),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              margin: EdgeInsets.only(left: 15.w),
              child: Text('Discover something now',
                style: MyFonts.styleMedium500_18.copyWith(color:MyColors.blackFlower,
                )),
            ),
            const DiscoverSomethingList(),
            SizedBox(height: 50.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8.w),
                  child: Text('Categories',
                    style: MyFonts.styleMedium500_18.copyWith(color: MyColors.blackBase)),
        
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.w,right: 15.w),
                  child: Text('View All',
                    style: MyFonts.styleMedium500_14.copyWith(color: MyColors.baseColor,decoration: TextDecoration.underline)),
                ),
              ],
            ),
            const CustomCategoriesList(),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8.w),
                  child: Text('Best seller',
                    style: MyFonts.styleMedium500_18.copyWith(color: MyColors.blackBase)),
        
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.w,right: 15.w),
                  child: Text('View All',
                     style: MyFonts.styleMedium500_12.copyWith(color: MyColors.baseColor,decoration: TextDecoration.underline)),
                ),
              ],
            ),
           const CustomBestSellerList(),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8.w),
                  child: Text('Occasion',
                    style:MyFonts.styleMedium500_18.copyWith(color: MyColors.blackBase)),
        
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.w,right: 15.w),
                  child: Text('View All',
                    style: MyFonts.styleMedium500_12.copyWith(color: MyColors.baseColor,decoration: TextDecoration.underline)),
        
                ),
              ],
            ),
           const CustomOccasionList(),
          ],
        ),
      ),
    );
  }
}
