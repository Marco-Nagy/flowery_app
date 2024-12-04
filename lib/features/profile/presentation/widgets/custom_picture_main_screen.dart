import 'dart:io';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_view_model_cubit.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPictureMainScreen extends StatefulWidget {
  const CustomPictureMainScreen({super.key});

  @override
  State<CustomPictureMainScreen> createState() =>
      _CustomPictureMainScreenState();
}

class _CustomPictureMainScreenState extends State<CustomPictureMainScreen> {
  final File? _image = null;
  ProfileViewModelCubit profileViewModel = getIt.get <ProfileViewModelCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileViewModel,
      child: BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
        builder: (context, state) {
         switch(state) {
           case ProfileViewModelInitial():
             // TODO: Handle this case.
           case GetLoggedUserDataLoading():
             // TODO: Handle this case.
           case GetLoggedUserDataSuccess():
           return Container(
             margin: EdgeInsets.only(top: 40.h, right: 25.w),
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
                     backgroundImage: FileImage(_image) as ImageProvider),
               ],
             ),
           );
           case GetLoggedUserDataError():
             // TODO: Handle this case.
           case EditProfileLoading():
             // TODO: Handle this case.
           case EditProfileSuccess():
             // TODO: Handle this case.
           case EditProfileError():
             // TODO: Handle this case.
         }
         return Container();
        },
      ),
    );
  }
}
