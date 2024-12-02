import 'package:flutter/material.dart';

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
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
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
            hintText: 'Current Password',
            labelText: 'Current Password',
            validator: (value) => Validators.validatePassword(value),
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
            hintText: 'New Password',
            labelText: 'New Password',
            validator: (value) => Validators.validatePassword(value),
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
            hintText: 'Confirm Password',
            labelText: 'Confirm Password',
            validator: (value) => Validators.validatePasswordConfirmation(
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
