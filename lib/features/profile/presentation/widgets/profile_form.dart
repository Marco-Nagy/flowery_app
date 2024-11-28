import 'package:flutter/material.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import '../../../../core/utils/validators.dart';
import '../../../auth/presentation/login/widgets/custom_text_form_field.dart';
import 'change_text.dart';

class ProfileForm extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneNumberController;
  final GlobalKey<FormState> formKey;

  const ProfileForm({
    Key? key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneNumberController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                    controller: firstNameController,
                    hintText: 'First name',
                    labelText: 'First name',
                    validator: (value) => Validators.validateNotEmpty(
                        title: 'First name', value: value)),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextFormField(
                    controller: lastNameController,
                    hintText: 'Last name',
                    labelText: 'Last name',
                    validator: (value) => Validators.validateNotEmpty(
                        title: 'Last name', value: value)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: emailController,
            hintText: 'Email',
            labelText: 'Email',
            validator: (value) => Validators.validateEmail(value),
          ),
          verticalSpacing(20),
          CustomTextFormField(
            suffix: ChangeText(),
            isPassword: true,
            controller: passwordController,
            hintText: '******',
            labelText: 'Password',
            // validator: (value) => Validators.validatePassword(value, context),
          ),
          verticalSpacing(20),
          CustomTextFormField(
            controller: phoneNumberController,
            hintText: 'Phone Number',
            labelText: 'Phone Number',
            validator: (value) => Validators.validatePhoneNumber(value),
          ),
        ],
      ),
    );
  }
}
