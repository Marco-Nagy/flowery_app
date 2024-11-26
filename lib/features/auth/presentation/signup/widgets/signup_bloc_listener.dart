import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/widgets/base/app_loader.dart';
import '../../../../../core/utils/widgets/base/snack_bar.dart';
import '../view_model/signup_view_model_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpViewModel, SignUpViewModelState>(
      listener: (context, state) {
        switch (state) {
          case SignupLoading():
            AppLoader();
            break;
          case SignupSuccess():
            aweSnackBar(
                msg: state.response.message!,
                context: context,
                type: MessageTypeConst.success,
                title: "Success");
            context.pushNamed(AppRoutes.login);
            break;
          case SignupError():
            return aweSnackBar(
                msg: state.message.error!,
                context: context,
                type: MessageTypeConst.failure,
                title: 'Error');
          default:
            return null;
        }
      },
      child: Container(),
    );
  }
}
