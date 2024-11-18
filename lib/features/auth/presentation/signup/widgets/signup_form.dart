import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/auth/presentation/signup/view_model/signup_cubit.dart';
import 'package:flowery_e_commerce/features/auth/presentation/signup/widgets/auth_footer.dart';
import 'package:flowery_e_commerce/features/auth/presentation/signup/widgets/condition_text.dart';
import 'package:flowery_e_commerce/features/auth/presentation/signup/widgets/signup_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/widgets/buttons/carved_button.dart';
import '../../../../../core/utils/widgets/custom_toast.dart';
import '../../../../../core/utils/widgets/spacing.dart';
import '../view_model/signup_action.dart';
import 'gender_selection.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupCubit>(),
      child: BlocConsumer<SignupCubit, SignupState>(listener: (context, state) {
        switch (state) {
          case SignupLoading():
            CustomToast.showLoadingToast(message: "Loading...");
            break;
          case SignupSuccess():
            CustomToast.showSuccessToast(message: "Sign up successfully");
            break;
          case SignupError():
            return CustomToast.showErrorToast(message: state.exception.error!);
          default:
            return null;
        }
      }, builder: (context, state) {
        final cubit = context.read<SignupCubit>();
        return Form(
          key: cubit.signUpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SignUpFields(cubit: cubit),
              GenderSelection(cubit: cubit),
              verticalSpacing(
                20,
              ),
              conditionText(),
              verticalSpacing(
                50,
              ),
              CurvedButton(
                title: 'Sign up',
                onTap: () {
                  cubit.doAction(SignupActionSelected());
                },
              ),
              verticalSpacing(
                15,
              ),
              AuthFooter(
                  question: 'Already have an account?',
                  txt: 'Login',
                  onPressed: () {
                    context.pushNamed(AppRoutes.login);
                  }),
            ],
          ),
        );
      }),
    );
  }
}
