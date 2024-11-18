import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/validators.dart';
import '../../../../../core/utils/widgets/app_text_form_field.dart';
import '../../../../../core/utils/widgets/spacing.dart';
import '../view_model/signup_cubit.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({super.key, required this.cubit});

  final SignupCubit cubit;

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
                hintText: 'Enter first name',
                labelText: 'First name',
                validator: (value) => Validators.validateNotEmpty(
                  title: 'First name',
                  value: value,
                ),
              ),
            ),
            horizontalSpacing(
              10,
            ),
            Expanded(
              child: AppTextFormField(
                controller: cubit.lastNameController,
                hintText: 'Enter last name',
                labelText: 'Last name',
                validator: (value) => Validators.validateNotEmpty(
                  title: 'First name',
                  value: value,
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
          hintText: 'Enter you email',
          labelText: 'Email',
          validator: (value) => Validators.validateEmail(value),
        ),
        verticalSpacing(
          20,
        ),
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                controller: cubit.passwordController,
                hintText: 'Enter password',
                labelText: 'Password',
                validator: (value) => Validators.validatePassword(value),
              ),
            ),
            horizontalSpacing(
              10,
            ),
            Expanded(
              child: AppTextFormField(
                controller: cubit.confirmPasswordController,
                hintText: 'Confirm password',
                labelText: 'Confirm password',
                validator: (value) => Validators.validatePassword(value),
              ),
            ),
          ],
        ),
        verticalSpacing(
          20,
        ),
        AppTextFormField(
          controller: cubit.phoneNumberController,
          hintText: 'Enter phone number',
          labelText: 'Phone number',
          validator: (value) => Validators.validatePhoneNumber(value),
        ),
        verticalSpacing(
          30,
        ),
      ],
    );
  }
}
