import 'dart:io';

import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_view_model_cubit.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/di.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _image = null;
  late final profileViewModel;

  initState() {
    super.initState();
    profileViewModel = getIt.get<ProfileViewModelCubit>();
    // profileViewModel.doAction(GetCachedProfileImage());
  }

  void _setImage(File? image) {
    setState(() {
      _image = image;
    });
  }

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
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              _image == null
                  ? CircleAvatar(
                      backgroundImage: AssetImage(Assets.imagesProfile),
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(_image!) as ImageProvider),
              Positioned(
                right: -18,
                bottom: 2,
                child: SizedBox(
                  height: 46,
                  width: 46,
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
                      size: 22,
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
