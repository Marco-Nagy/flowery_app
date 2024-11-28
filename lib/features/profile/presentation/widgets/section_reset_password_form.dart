import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/features/profile/presentation/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/widgets/base/snack_bar.dart';
import '../../../../di/di.dart';
import '../../domain/entities/request/change_password_request_entity.dart';
import '../viewModel/profile_actions.dart';
import '../viewModel/profile_view_model_cubit.dart';

class SectionResetPasswordForm extends StatefulWidget {
  const SectionResetPasswordForm({super.key});

  @override
  State<SectionResetPasswordForm> createState() =>
      _SectionResetPasswordFormState();
}

class _SectionResetPasswordFormState extends State<SectionResetPasswordForm> {
  late final ProfileViewModelCubit profileViewModel;
  late final TextEditingController passwordController;
  late final TextEditingController newPasswordController;
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    newPasswordController = TextEditingController();
    profileViewModel = getIt.get<ProfileViewModelCubit>();
  }

  @override
  void dispose() {
    passwordController.dispose();
    newPasswordController.dispose();
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
                    passwordController: passwordController,
                    newPasswordController: newPasswordController,
                    formKey: formKey),
                const SizedBox(
                  height: 55,
                ),
                CurvedButton(
                    title: 'Update',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        profileViewModel.doAction(ChangePassword(
                            request: ChangePasswordRequestEntity(
                                password: passwordController.text,
                                newPassword: newPasswordController.text)));
                      }
                    }),
              ],
            );
          },
          listener: (context, state) {
            switch (state) {
              case ChangePasswordLoading():
                aweSnackBar(
                    msg: 'Loading...',
                    context: context,
                    type: MessageTypeConst.help,
                    title: 'Loading');
                break;
              case ChangePasswordSuccess():
                aweSnackBar(
                    msg: 'Success',
                    context: context,
                    type: MessageTypeConst.success,
                    title: 'Success');
                context.pushReplacementNamed(AppRoutes.profileView);
                break;
              case ChangePasswordError():
                aweSnackBar(
                    msg: '${state.error.error.toString()}',
                    context: context,
                    type: MessageTypeConst.success,
                    title: 'Error');
                break;
              default:
            }
          },
        ));
  }
}
