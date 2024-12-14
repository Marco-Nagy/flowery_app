import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/utils/widgets/app_text_form_field.dart';
import '../../../../../core/utils/widgets/spacing.dart';
import '../view_model/signup_view_model_cubit.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({super.key, required this.cubit});

  final SignUpViewModel cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                controller: cubit.firstNameController,
                hintText:AppLocalizations.of(context)!.hintFirstName,
                labelText: AppLocalizations.of(context)!.first_name,
                validator: (value) => Validators.validateNotEmpty(
                  title: AppLocalizations.of(context)!.first_name,
                  value: value,
                  context: context,
                ),
              ),
            ),
            horizontalSpacing(
              10,
            ),
            Expanded(
              child: AppTextFormField(
                controller: cubit.lastNameController,
                hintText:AppLocalizations.of(context)!.hintFirstName,
                labelText: AppLocalizations.of(context)!.last_name,
                validator: (value) => Validators.validateNotEmpty(
                  title: AppLocalizations.of(context)!.last_name,
                  value: value,
                  context: context,
                ),
              ),
            ),
          ],
        ),
        verticalSpacing(
          20,
        ),
        AppTextFormField(
          controller: cubit.emailController,
          hintText:  AppLocalizations.of(context)!.hintEmail,
          labelText: AppLocalizations.of(context)!.email,
          validator: (value) => Validators.validateEmail(value, context),
        ),
        verticalSpacing(
          20,
        ),
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                controller: cubit.passwordController,
                hintText:  AppLocalizations.of(context)!.hintPassword,
                labelText:  AppLocalizations.of(context)!.password,
                validator: (value) => Validators.validatePassword(value, context),
              ),
            ),
            horizontalSpacing(
              10,
            ),
            Expanded(
              child: AppTextFormField(
                controller: cubit.confirmPasswordController,
                hintText: AppLocalizations.of(context)!.confirmPassword,
                labelText:  AppLocalizations.of(context)!.confirmPassword,
                validator: (value) => Validators.validatePassword(value, context),
              ),
            ),
          ],
        ),
        verticalSpacing(
          20,
        ),
        AppTextFormField(
          controller: cubit.phoneNumberController,
          hintText: AppLocalizations.of(context)!.hintPhoneNumber,
          labelText:  AppLocalizations.of(context)!.phone_number,
          validator: (value) => Validators.validatePhoneNumber(value, context),
        ),

      ],
    );
  }
}
