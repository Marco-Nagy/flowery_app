import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_actions.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/profile_main_screen/presentation/widgets/custom_picture_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMainProfileData extends StatefulWidget {
  const CustomMainProfileData({super.key});

  @override
  State<CustomMainProfileData> createState() => _CustomMainProfileDataState();
}

class _CustomMainProfileDataState extends State<CustomMainProfileData> {
  @override
  Widget build(BuildContext context) {
   return  Column(
        children: [
          CustomPictureMainScreen(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Somaya',
                style: MyFonts.styleMedium500_18.copyWith(
                  color: MyColors.blackBase,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              InkWell(
                onTap: () {
                  context.pushNamed(AppRoutes.profileView);
                },
                child: SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: Image.asset('assets/images/pen.png')),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'Somaya_Mahmoud@gmail.com',
            style: MyFonts.styleMedium500_18.copyWith(
              color: MyColors.grey,
            ),
          ),
        ],
      );
  }
}




