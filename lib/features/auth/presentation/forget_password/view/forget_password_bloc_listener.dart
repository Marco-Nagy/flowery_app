import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/features/auth/presentation/forget_password/ViewModel/forget_password_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/widgets/base/snack_bar.dart';
import '../ViewModel/forget_password_view_model_state.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key, this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordViewModelCubit,
            ForgetPasswordViewModelState>(
        listener: (context, state) {
          switch (state) {
            case VerifyResetCodeTimeOut():
              break;
            case ForgetPasswordSuccess():

              return aweSnackBar(
                  msg: state.response.info!,
                  context: context,
                  type: MessageTypeConst.success,
                  title: AppLocalizations.of(context)!.success,);
            case VerifyResetCodeSuccess():
              context.pushReplacementNamed(AppRoutes.resetPassWord);
              return aweSnackBar(
                  msg: state.response.status!,
                  context: context,
                  type: MessageTypeConst.success, title: AppLocalizations.of(context)!.success,);
            case ResetPasswordSuccess():
              context.pushReplacementNamed(AppRoutes.login);
              return aweSnackBar(
                  msg: state.response.message!,
                  context: context,
                  type: MessageTypeConst.success, title: AppLocalizations.of(context)!.success,);
            case VerifyResetCodeFailed():
            return aweSnackBar(
                msg: state.errorModel.error!,
                context: context,
                type: MessageTypeConst.failure, title: AppLocalizations.of(context)!.error,);
            case ForgetPasswordFailed():
            return aweSnackBar(
                msg: state.errorModel.error!,
                context: context,
                type: MessageTypeConst.failure, title: AppLocalizations.of(context)!.error,);
            case ResetPasswordFailed():
           return aweSnackBar(
                msg: state.errorModel.error!,
                context: context,
                type: MessageTypeConst.failure, title: AppLocalizations.of(context)!.error,);
            case ForgetPasswordLoading():
            case VerifyResetCodeLoading():
            case ResetPasswordLoading():
              const AppLoader();
            case ForgetPasswordInitial():
          }
        },
        child: Container());
  }
}
