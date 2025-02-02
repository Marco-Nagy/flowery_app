import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/auth/presentation/forget_password/widgets/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import '../../../../../core/localization/lang_keys.dart';
import '../ViewModel/forget_password_view_model_cubit.dart';
import '../widgets/screen_description.dart';
import '../widgets/screen_title.dart';
import '../widgets/verification_code.dart';
import 'forget_password_bloc_listener.dart';

class EmailVerification extends HookWidget {
  EmailVerification(this.email, {super.key});

  final formKye = GlobalKey<FormState>();
  final String email;

  @override
  Widget build(BuildContext context) {
    useEffect(
            () {
          context.read<ForgetPasswordViewModelCubit>().initTimer();
          return null;
        }    );

    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColors.white,
      appBar: customAppBar(
          appBarTxt: context.translate(LangKeys.password),
          context: context,
          showArrow: true,
          navigation: () {
            context.pop();
          }),
      body: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Center(
          child: Form(
            key: formKye,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ForgetPasswordBlocListener(),
                verticalSpacing(40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0.w),
                  child: Column(
                    children: [
                       ScreenTitle(
                        title:context.translate(LangKeys.emailVerificationTitle),
                      ),
                      verticalSpacing(16),
                       ScreenDescription(
                          title: context.translate(LangKeys.emailVerificationDescription)
          ),
                    ],
                  ),
                ),
                verticalSpacing(32),
                const VerificationCode(),
                verticalSpacing(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.translate(LangKeys.notReceiveCode),
                      textAlign: TextAlign.center,
                      style: MyFonts.styleRegular400_16
                          .copyWith(color: MyColors.black),
                    ),
                    horizontalSpacing(8),
                    TimerWidget(email: email)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
