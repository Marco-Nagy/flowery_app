import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            hintText: AppLocalizations.of(context)!.currentPassword,
            labelText: AppLocalizations.of(context)!.currentPassword,
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
            hintText:  AppLocalizations.of(context)!.newPassword,
            labelText: AppLocalizations.of(context)!.newPassword,
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
            hintText: AppLocalizations.of(context)!.confirmPassword,
            labelText: AppLocalizations.of(context)!.confirmPassword,
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
