import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery_store/features/profile/presentation/viewModel/profile_view_model_cubit.dart';
import 'package:flowery_store/generated/assets.dart';
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

  ProfileViewModelCubit get profileViewModel =>
      context.read<ProfileViewModelCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileViewModel,
      child: BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
        builder: (context, state) {
          if (state is GetLoggedUserDataLoading) {
            return const CircleAvatar(
              backgroundImage: AssetImage(Assets.imagesProfile),
            );
          }
          if (state is GetLoggedUserDataSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 40.h, right: 25.w),
              height: 115.h,
              width: 115.w,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  state.data.user!.photo == null
                      ? const CircleAvatar(
                          backgroundImage: AssetImage(Assets.imagesProfile),
                        )
                      : CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                          state.data.user!.photo.toString(),
                        )),
                ],
              ),
            );
          }

          return Container(
            margin: EdgeInsets.only(top: 40.h, right: 25.w),
            height: 115.h,
            width: 115.w,
            child: const Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(Assets.imagesProfile),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
