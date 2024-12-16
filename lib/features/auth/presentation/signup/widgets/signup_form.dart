import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/features/auth/presentation/signup/view_model/signup_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/auth/presentation/signup/widgets/auth_footer.dart';
import 'package:flowery_e_commerce/features/auth/presentation/signup/widgets/condition_text.dart';
import 'package:flowery_e_commerce/features/auth/presentation/signup/widgets/signup_bloc_listener.dart';
import 'package:flowery_e_commerce/features/auth/presentation/signup/widgets/signup_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/widgets/buttons/carved_button.dart';
import '../../../../../core/utils/widgets/spacing.dart';
import '../view_model/signup_action.dart';
import 'gender_selection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpViewModel>();

    return Form(
      key: cubit.signUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignUpBlocListener(),
          BlocBuilder<SignUpViewModel, SignUpViewModelState>(
              builder: (context, state) {
            return Column(
              children: [
                SignUpFields(cubit: cubit),
                verticalSpacing(
                  30,
                ),
                GenderSelection(cubit: cubit),
              ],
            );
          }),
          verticalSpacing(
            20,
          ),
          conditionText(context),
          verticalSpacing(
            50,
          ),
          CurvedButton(
            title:AppLocalizations.of(context)!.signUp,
            onTap: () {
              cubit.doAction(SignupActionSelected());
            },
          ),
          verticalSpacing(
            15,
          ),
          AuthFooter(
              question: AppLocalizations.of(context)!.alreadyHaveAnAccount,
              txt: AppLocalizations.of(context)!.login,
              onPressed: () {
                context.pushNamed(AppRoutes.login);
              }),
        ],
      ),
    );
  }
}
