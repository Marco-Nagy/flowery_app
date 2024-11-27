import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomSwitchIcon extends StatefulWidget {
  const CustomSwitchIcon({super.key});

  @override
  State<CustomSwitchIcon> createState() => _CustomSwitchIconState();
}

class _CustomSwitchIconState extends State<CustomSwitchIcon> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60.h,
      margin: EdgeInsets.all(12.sp),
      child: Row(
        children: [
          SizedBox(
            width: 80.w,
            height: 40.h,
            child: Image.asset('assets/images/switch.png'),
          ),
          SizedBox(width: 3.sp,),
          Text('Notification',style: MyFonts.styleRegular400_16.copyWith(
            color: MyColors.blackBase,
          ),),
          Spacer(),
          InkWell(
            onTap: (){
            },
            child: Container(
              margin: EdgeInsets.only(right: 23.sp),
                width: 20.w,
                height: 20.w,
                child: Image.asset('assets/images/drop_down_arrow.png',)),
          )  ,
        ],
      ),
    );
  }
}
