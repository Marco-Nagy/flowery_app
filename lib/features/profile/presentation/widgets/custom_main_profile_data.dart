import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_actions.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/profile/presentation/widgets/custom_picture_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMainProfileData extends StatefulWidget {
  const CustomMainProfileData({super.key});

  @override
  State<CustomMainProfileData> createState() => _CustomMainProfileDataState();
}

class _CustomMainProfileDataState extends State<CustomMainProfileData> {
  ProfileViewModelCubit profileViewModelCubit = getIt.get<
      ProfileViewModelCubit>();
  String name = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileViewModelCubit..doAction(GetLoggedUserData()),
      child: BlocConsumer<ProfileViewModelCubit, ProfileViewModelState>(
        listener: (context, state) {
          switch(state) {
            case GetLoggedUserDataLoading():
            aweSnackBar(
                msg: 'Loading...',
                context: context,
                type: MessageTypeConst.help,
                title: 'Loading');
            break;
            case GetLoggedUserDataSuccess():
              name = state.data.user!.firstName?? '';
              email = state.data.user!.email ?? '';
              print('name is : ${state.data.user!.firstName}');
              print('email is : ${state.data.user!.email}');
            case GetLoggedUserDataError():
              aweSnackBar(
                  msg: state.error.toString(),
                  context: context,
                  type: MessageTypeConst.failure,
                  title: 'Error');
              break;
            case EditProfileLoading():
              // TODO: Handle this case.
            case EditProfileSuccess():
              // TODO: Handle this case.
            case EditProfileError():
              // TODO: Handle this case.
            case ProfileViewModelInitial():
            // TODO: Handle this case.
            default:
              break;
          }
        },
        builder: (context, state) {
         if(state is GetLoggedUserDataSuccess){
            return Column(
             children: [
               CustomPictureMainScreen(),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     '${state.data.user!.firstName}',
                     style: MyFonts.styleMedium500_18.copyWith(
                       color: MyColors.blackBase,
                     ),
                   ),
                   SizedBox(
                     width: 6.w,
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
                 '${state.data.user!.email}',
                 style: MyFonts.styleMedium500_18.copyWith(
                   color: MyColors.grey,
                 ),
               ),
             ],
           );
         }else{
           return SizedBox();
         }
        },
      ),
    );
  }
}
