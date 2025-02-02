import 'package:flutter/cupertino.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import '../../../../../core/localization/lang_keys.dart';
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
                hintText:context.translate(LangKeys.hintFirstName),
                labelText: context.translate(LangKeys.firstName),
                validator: (value) => Validators.validateNotEmpty(
                  title: context.translate(LangKeys.firstName),
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
                hintText:context.translate(LangKeys.hintLastName),
                labelText: context.translate(LangKeys.lastName),
                validator: (value) => Validators.validateNotEmpty(
                  title: context.translate(LangKeys.lastName),
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
          hintText:  context.translate(LangKeys.hintEmail),
          labelText: context.translate(LangKeys.email),
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
                hintText:  context.translate(LangKeys.hintPassword),
                labelText:  context.translate(LangKeys.password),
                validator: (value) => Validators.validatePassword(value, context),
              ),
            ),
            horizontalSpacing(
              10,
            ),
            Expanded(
              child: AppTextFormField(
                controller: cubit.confirmPasswordController,
                hintText:context.translate(LangKeys.hintConfirmPassword),
                labelText: context.translate(LangKeys.confirmPassword),
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
          hintText: context.translate(LangKeys.hintPhoneNumber),
          labelText: context.translate(LangKeys.phoneNumber),
          validator: (value) => Validators.validatePhoneNumber(value, context),
        ),

      ],
    );
  }
}
