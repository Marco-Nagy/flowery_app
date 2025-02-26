import 'dart:io';

import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/get_logged_user_data_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_view_model_cubit.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPictureMainScreen extends StatefulWidget {
 final GetLoggedUserDataResponseUserEntity user;
  const CustomPictureMainScreen({super.key, required this.user});

  @override
  State<CustomPictureMainScreen> createState() =>
      _CustomPictureMainScreenState();
}

class _CustomPictureMainScreenState extends State<CustomPictureMainScreen> {
  final File? _image = null;
  ProfileViewModelCubit profileViewModel = getIt.get<ProfileViewModelCubit>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.h, right: 25.w),
      height: 115.h,
      width: 115.w,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          widget.user.photo!.isEmpty||widget.user.photo==null
              ? const CircleAvatar(
            backgroundImage: AssetImage(Assets.imagesProfile),
          )
              : CircleAvatar(
              backgroundImage: NetworkImage(widget.user.photo!) as ImageProvider),
        ],
      ),
    );
  }
}
