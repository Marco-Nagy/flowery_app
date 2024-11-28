import 'dart:io';

import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_view_model_cubit.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../di/di.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _image;
  late final ProfileViewModelCubit profileViewModel;

  @override
 void initState() {
    super.initState();
    profileViewModel = getIt.get<ProfileViewModelCubit>();
    // profileViewModel.doAction(GetCachedProfileImage());
  }

  // void _setImage(File? image) {
  //   setState(() {
  //     _image = image;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileViewModelCubit>(
      create: (context) => profileViewModel,
      child: BlocListener<ProfileViewModelCubit, ProfileViewModelState>(
        listener: (context, state) {
          // if (state is CachedProfileImageLoadedState) {
          //   _setImage(state.imageFile);
          // }
        },
        child: SizedBox(
          height: 115.h,
          width: 115.w,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              _image == null
                  ? const CircleAvatar(
                      backgroundImage: AssetImage(Assets.imagesProfile),
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(_image!) as ImageProvider),
              Positioned(
                right: -18.w,
                bottom: 2.h,
                child: SizedBox(
                  height: 46.h,
                  width: 46.w,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: MyColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: const BorderSide(color: MyColors.white),
                      ),
                      backgroundColor: MyColors.lightPink,
                    ),
                    onPressed: () {
                      // showImagePickerSheet(context, (File? image) {
                      //   if (image != null) {
                      //     profileViewModel
                      //         .doAction(CacheProfileImage(imageFile: image));
                      //     _setImage(image);
                      //     setState(() {}); // Cache the image path
                      //   } else {
                      //     _setImage(null);
                      //     setState(() {}); // Remove the image if null is passed
                      //   }
                      // });
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: MyColors.gray,
                      size: 22.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
