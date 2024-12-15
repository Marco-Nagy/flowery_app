import 'package:flutter/material.dart';
import 'package:flowery_e_commerce/core/utils/validators.dart';
import 'custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      validator: (value) => Validators.validateEmail(value, context),
      hintText: AppLocalizations.of(context)!.hintEmail,
      labelText: AppLocalizations.of(context)!.email,
    );
  }
}
