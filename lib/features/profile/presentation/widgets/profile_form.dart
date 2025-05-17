import 'package:flowery_store/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flowery_store/core/utils/widgets/spacing.dart';
import '../../../../core/localization/lang_keys.dart';
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
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneNumberController,
    required this.formKey,
  });

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
                    hintText: context.translate(LangKeys.hintFirstName),
                    labelText: context.translate(LangKeys.labelFirstName),
                    validator: (value) => Validators.validateNotEmpty(
                        title: context.translate(LangKeys.labelFirstName), value: value, context: context)),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextFormField(
                    controller: lastNameController,
                    hintText: context.translate(LangKeys.hintFirstName),
                    labelText: context.translate(LangKeys.labelLastName),
                    validator: (value) => Validators.validateNotEmpty(
                        title: context.translate(LangKeys.labelLastName), value: value, context: context)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: emailController,
            hintText: context.translate(LangKeys.hintEmail),
            labelText: context.translate(LangKeys.labelEmail),
            validator: (value) => Validators.validateEmail(value, context),
          ),
          verticalSpacing(20),
          CustomTextFormField(
            suffix: const ChangeText(),
            isPassword: true,
            controller: passwordController,
            hintText: '******',
            labelText: context.translate(LangKeys.password),
            // validator: (value) => Validators.validatePassword(value, context),
          ),
          verticalSpacing(20),
          CustomTextFormField(
            controller: phoneNumberController,
            hintText: context.translate(LangKeys.phoneNumber),
            labelText: context.translate(LangKeys.phoneNumber),
            validator: (value) => Validators.validatePhoneNumber(value, context),
          ),
        ],
      ),
    );
  }
}
