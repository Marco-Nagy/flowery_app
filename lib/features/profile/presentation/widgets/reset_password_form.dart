import 'package:flutter/material.dart';
import '../../../../core/utils/validators.dart';
import '../../../auth/presentation/login/widgets/custom_text_form_field.dart';
import 'change_text.dart';

class ResetPasswordForm extends StatefulWidget {
  final TextEditingController oldPasswordController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  final GlobalKey<FormState> formKey;

  const ResetPasswordForm({
    Key? key,
    required this.oldPasswordController,
    required this.passwordController,
    required this.rePasswordController,
    required this.formKey,
  }) : super(key: key);

  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  bool _oldPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            isPassword: !_oldPasswordVisible,
            controller: widget.oldPasswordController,
            hintText: 'Current Password',
            labelText: 'Current Password',
            validator: (value) => Validators.validatePassword(value),
            suffix: InkWell(
              child: Icon(
                _oldPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onTap: () {
                setState(() {
                  _oldPasswordVisible = !_oldPasswordVisible;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            isPassword: !_newPasswordVisible,
            controller: widget.passwordController,
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
            controller: widget.rePasswordController,
            hintText: 'Confirm Password',
            labelText: 'Confirm Password',
            validator: (value) => Validators.validatePasswordConfirmation(
                password: widget.passwordController.text,
                confirmPassword: value),
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
