import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void ShowLogoutDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: SizedBox(
            width: 800.w,
            height: 300.h,
            child: AlertDialog(
              content: Column(
                children: [
                  Text(
                    'LOGOUT',
                    style: MyFonts.styleSemiBold600_18.copyWith(
                      color: MyColors.blackBase,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    'Confirm logout!!',
                    style: MyFonts.styleRegular400_18
                        .copyWith(color: MyColors.blackBase),
                  ),
                  SizedBox(height: 22.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: 115.w,
                          height: 55.h,
                          child: CurvedButton(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              title:
                                'Cancle',
                            color: MyColors.whiteBase,
                            textColor: MyColors.grey,
                            colorBorderSide: MyColors.gray,
                          ),
                              ),
                      SizedBox(
                        width: 115.w,
                        height: 55.h,
                        child: CurvedButton(
                          title: 'Logout',
                          onTap: () {},
                          color: MyColors.baseColor,
                          textColor: MyColors.whiteBase,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
