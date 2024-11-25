import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/request/login_request_entity.dart';
import '../viewModel/login_action.dart';
import '../viewModel/login_view_model_cubit.dart';

class LoginButtons extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final formKey;
  final bool rememberMe;

  const LoginButtons({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.rememberMe,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewModel>();

    return SliverToBoxAdapter(
      child: Column(
        children: [
          CurvedButton(
            color: MyColors.baseColor,
            title: "Login",
            onTap: () {
              if (formKey.currentState!.validate()) {
                viewModel.doAction(LoginAction(
                  LoginRequestEntity(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  ),
                  rememberMe,
                  context, // Pass the rememberMe value here
                ));
              }
            },
          ),
          const SizedBox(height: 16),
          CurvedButton(
            color: MyColors.white,
            title: "Continue as guest",
            onTap: () {
              context.pushReplacementNamed(AppRoutes.homeScreen);
            },
            colorBorderSide: MyColors.gray,
            textColor: MyColors.gray,
          ),
        ],
      ),
    );
  }
}
