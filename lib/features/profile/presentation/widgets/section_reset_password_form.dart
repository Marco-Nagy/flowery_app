import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/features/profile/presentation/viewModel/profile_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/profile/presentation/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/di.dart';

class SectionResetPasswordForm extends StatefulWidget {
  const SectionResetPasswordForm({super.key});

  @override
  State<SectionResetPasswordForm> createState() =>
      _SectionResetPasswordFormState();
}

class _SectionResetPasswordFormState extends State<SectionResetPasswordForm> {
  late final ProfileViewModelCubit profileViewModel;
  late final TextEditingController oldPasswordController;
  late final TextEditingController passwordController;
  late final TextEditingController rePasswordController;
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    oldPasswordController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    profileViewModel = getIt.get<ProfileViewModelCubit>();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileViewModelCubit>(
        create: (context) => profileViewModel,
        child: BlocConsumer<ProfileViewModelCubit, ProfileViewModelState>(
          builder: (context, state) {
            return Column(
              children: [
                ResetPasswordForm(
                    oldPasswordController: oldPasswordController,
                    passwordController: passwordController,
                    rePasswordController: rePasswordController,
                    formKey: formKey),
                const SizedBox(
                  height: 55,
                ),
                GestureDetector(
                  onTap: () {
                    // if (formKey.currentState!.validate()) {
                    //   profileViewModel.doAction(ChangePassword(
                    //       context: context,
                    //       request: ChangePasswordRequestEntity(
                    //           oldPassword: oldPasswordController.text,
                    //           password: passwordController.text,
                    //           rePassword: rePasswordController.text)));
                    // }
                  },
                  child: CurvedButton(
                    title: "Update",
                    color: MyColors.baseColor,
                    onTap: () {},
                  ),
                ),
              ],
            );
          },
          listener: (context, state) {
            // switch (state) {
            //   case ChangePasswordLoading():
            //     {
            //       CustomToast.showLoadingToast(
            //           message: "${AppLocalizations.of(context)!.loading}");
            //       break;
            //     }
            //   case ChangePasswordSuccess():
            //     {
            //       CustomToast.showSuccessToast(
            //           message: "${AppLocalizations.of(context)!.success}");
            //       break;
            //     }
            //   case ChangePasswordError():
            //     {
            //       CustomToast.showErrorToast(
            //           message: state.exception.toString());
            //       break;
            //     }
            //   default:
            // }
          },
        ));
  }
}
