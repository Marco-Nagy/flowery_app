import 'package:flowery_e_commerce/core/utils/widgets/base/custom_app_bar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/base_view.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_toast.dart';
import 'package:flowery_e_commerce/di/di.dart';

import '../viewModel/login_view_model_cubit.dart';
import '../widgets/footer_sign_up.dart';
import '../widgets/login_buttons.dart';
import '../widgets/login_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel viewModel;
  late var emailController;
  late var passwordController;
  final formKey = GlobalKey<FormState>();
  bool rememberMe = false;

  @override
  void initState() {
    viewModel = getIt.get<LoginViewModel>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginViewModel>(
      create: (context) => viewModel,
      child: BlocConsumer<LoginViewModel, LoginViewModelState>(
        buildWhen: (previous, current) => current is LoginViewModelInitial,
        builder: (context, state) {
          return BaseView(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CustomAppBar(appBarTxt: "Login"),
                ),
                SliverToBoxAdapter(
                  child: verticalSpacing(20),
                ),
                LoginForm(
                  formKey: formKey,
                  passwordController: passwordController,
                  emailController: emailController,
                  onRememberMeChanged: (bool value) {
                    setState(() {
                      rememberMe = value; // Update rememberMe value
                    });
                  },
                ),
                SliverToBoxAdapter(
                  child: verticalSpacing(70),
                ),
                LoginButtons(
                  emailController: emailController,
                  passwordController: passwordController,
                  formKey: formKey,
                  rememberMe: rememberMe, // Pass the rememberMe value
                ),
                SliverToBoxAdapter(
                  child: verticalSpacing(20),
                ),
                const FooterSignUp(),
              ],
            ),
          );
        },
        listener: (context, state) {
          switch (state) {
            case LoginViewModelLoading():
              CustomToast.showLoadingToast(message: "Loading...");
              break;
            case LoginViewModelSuccess():
              CustomToast.showSuccessToast(message: "Success");
              break;
            case LoginViewModelError():
              debugPrint(state.errorMessage.error);
              return CustomToast.showErrorToast(
                  message: state.errorMessage.error!);
            default:
              return null;
          }
        },
      ),
    );
  }
}
