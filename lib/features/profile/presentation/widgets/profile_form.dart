import 'package:flutter/material.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import '../../../../core/utils/validators.dart';
import '../../../auth/presentation/login/widgets/custom_text_form_field.dart';
import 'change_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
                    hintText: AppLocalizations.of(context)!.first_name,
                    labelText: AppLocalizations.of(context)!.first_name,
                    validator: (value) => Validators.validateNotEmpty(
                        title: AppLocalizations.of(context)!.first_name, value: value, context: context)),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextFormField(
                    controller: lastNameController,
                    hintText: AppLocalizations.of(context)!.last_name,
                    labelText: AppLocalizations.of(context)!.last_name,
                    validator: (value) => Validators.validateNotEmpty(
                        title: AppLocalizations.of(context)!.last_name, value: value, context: context)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: emailController,
            hintText: AppLocalizations.of(context)!.email,
            labelText: AppLocalizations.of(context)!.email,
            validator: (value) => Validators.validateEmail(value, context),
          ),
          verticalSpacing(20),
          CustomTextFormField(
            suffix: const ChangeText(),
            isPassword: true,
            controller: passwordController,
            hintText: '******',
            labelText: AppLocalizations.of(context)!.password,
            // validator: (value) => Validators.validatePassword(value, context),
          ),
          verticalSpacing(20),
          CustomTextFormField(
            controller: phoneNumberController,
            hintText: AppLocalizations.of(context)!.phone_number,
            labelText: AppLocalizations.of(context)!.phone_number,
            validator: (value) => Validators.validatePhoneNumber(value, context),
          ),
        ],
      ),
    );
  }
}
