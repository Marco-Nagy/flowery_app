import 'package:flutter/material.dart';
import 'package:flowery_e_commerce/core/utils/validators.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordField({super.key, required this.passwordController});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.passwordController,
      isPassword: !isPasswordVisible,
      validator: (value) => Validators.validatePassword(value, context),
      hintText: AppLocalizations.of(context)!.hintPassword,
      labelText:AppLocalizations.of(context)!.password,
      suffix: GestureDetector(
        child: Icon(
          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: MyColors.gray,
        ),
        onTap: () {
          setState(() {
            isPasswordVisible = !isPasswordVisible;
          });
        },
      ),
    );
  }
}
