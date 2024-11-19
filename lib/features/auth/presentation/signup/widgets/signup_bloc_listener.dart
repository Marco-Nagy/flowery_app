import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/widgets/custom_toast.dart';
import '../view_model/signup_view_model_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpViewModel, SignUpViewModelState>(
      listener: (context, state) {
        switch (state) {
          case SignupLoading():
            CustomToast.showLoadingToast(message: "Loading...");
            break;
          case SignupSuccess():
            CustomToast.showSuccessToast(message: "Sign up successfully");
            context.pushNamed(AppRoutes.login);
            break;
          case SignupError():
            return CustomToast.showErrorToast(message: state.message.error!);
          default:
            return null;
        }
      },
      child: Container(),
    );
  }
}
