import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              SizedBox(
                  width: 89.w,
                  height: 25.h,
                  child: Image.asset('assets/images/logo.png')),
              Stack(children: [
                SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Icon(
                      Icons.notifications,
                      color: MyColors.grey,
                    )),
                SizedBox(
                  width: 16.w,
                  height: 16.h,
                  child: CircleAvatar(
                    backgroundColor: MyColors.error,
                    child: SizedBox(
                      width: 8.w,
                      height: 13.h,
                      child: Text(
                        '3',
                        style: MyFonts.styleMedium500_11.copyWith(
                          color: MyColors.whiteBase,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
