import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/validators.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/request/reset_password_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/presentation/forget_password/ViewModel/forget_password_base_actions.dart';
import 'package:flowery_e_commerce/features/auth/presentation/forget_password/ViewModel/forget_password_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/utils/widgets/app_text_form_field.dart';
import '../widgets/screen_description.dart';
import '../widgets/screen_title.dart';
import 'forget_password_bloc_listener.dart';

class ResetPassword extends HookWidget {
  ResetPassword({super.key});

  final formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: customAppBar(
            appBarTxt: 'Password',
            context: context,
            showArrow: true,
            navigation: () {
              return null;
            }),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: formKye,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ForgetPasswordBlocListener(),
                    verticalSpacing(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        children: [
                          const ScreenTitle(
                            title: 'Reset password',
                          ),
                          verticalSpacing(16),
                          const ScreenDescription(
                              title:
                                  'Password must not be empty and must contain 6 characters with upper case letter and one number at least '),
                        ],
                      ),
                    ),
                    verticalSpacing(32),
                    AppTextFormField(
                      controller: emailController,
                      hintText: 'Enter you email',
                      labelText: 'Email',
                      validator: (value) => Validators.validateNotEmpty(
                          title: 'Email', value: value),
                    ),
                    verticalSpacing(16),
                    AppTextFormField(
                      controller: passwordController,
                      hintText: 'Enter your New Password',
                      labelText: 'New password',
                      validator: (value) => Validators.validatePassword(value),
                    ),
                    verticalSpacing(48),
                    CurvedButton(
                      color: MyColors.baseColor,
                      title: 'Continue',
                      onTap: () {
                        if (formKye.currentState!.validate()) {
                          context.read<ForgetPasswordViewModelCubit>().doAction(
                                  ResetPasswordAction(
                                      ResetPasswordRequestEntity(
                                email: emailController.text,
                                newPassword: passwordController.text,
                              )));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
