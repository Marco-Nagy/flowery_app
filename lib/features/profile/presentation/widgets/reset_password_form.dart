import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../../../auth/presentation/login/widgets/custom_text_form_field.dart';

class ResetPasswordForm extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController newPasswordController;
  final TextEditingController? confirmPasswordController;
  final GlobalKey<FormState> formKey;

  const ResetPasswordForm({
    super.key,
    this.confirmPasswordController,
    required this.passwordController,
    required this.newPasswordController,
    required this.formKey,
  });

  @override
  ResetPasswordFormState createState() => ResetPasswordFormState();
}

class ResetPasswordFormState extends State<ResetPasswordForm> {
  bool _passwordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            isPassword: !_passwordVisible,
            controller: widget.passwordController,
            hintText: context.translate(LangKeys.currentPassword),
            labelText: context.translate(LangKeys.currentPassword),
            validator: (value) => Validators.validatePassword(value, context),
            suffix: InkWell(
              child: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onTap: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          verticalSpacing(20),
          CustomTextFormField(
            isPassword: !_newPasswordVisible,
            controller: widget.newPasswordController,
            hintText:  context.translate(LangKeys.newPassword),
            labelText: context.translate(LangKeys.newPassword),
            validator: (value) => Validators.validatePassword(value, context),
            suffix: InkWell(
              child: Icon(
                _newPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onTap: () {
                setState(() {
                  _newPasswordVisible = !_newPasswordVisible;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            isPassword: !_confirmPasswordVisible,
            controller: widget.confirmPasswordController,
            hintText: context.translate(LangKeys.confirmPassword),
            labelText: context.translate(LangKeys.confirmPassword),
            validator: (value) => Validators.validatePasswordConfirmation(
              context:  context,
                confirmPassword: value,
                password: widget.newPasswordController.text),
            suffix: InkWell(
              child: Icon(
                _confirmPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onTap: () {
                setState(() {
                  _confirmPasswordVisible = !_confirmPasswordVisible;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
