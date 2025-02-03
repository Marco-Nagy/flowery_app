import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import '../../../../../core/localization/lang_keys.dart';
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
            const AppLoader();
            break;
          case SignupSuccess():
             aweSnackBar(
                msg: state.response.message!,
                context: context,
                type: MessageTypeConst.success,
                title: context.translate(LangKeys.success));
            context.pushNamed(AppRoutes.login);
            break;
          case SignupError():
            return aweSnackBar(
                msg: state.message.error!,
                context: context,
                type: MessageTypeConst.failure,
                title: context.translate(LangKeys.error));
            default:
            return ;
        }
      },
      child: Container(),
    );
  }
}
