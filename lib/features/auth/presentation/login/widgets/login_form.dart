import 'package:flutter/material.dart';
import 'email_field.dart';
import 'password_field.dart';
import 'remember_me_and_forgot_password.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function(bool) onRememberMeChanged;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onRememberMeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            EmailField(emailController: emailController),
            const SizedBox(height: 30),
            PasswordField(passwordController: passwordController),
            const SizedBox(height: 16),
            RememberMeAndForgotPassword(
              onRememberMeChanged: onRememberMeChanged,
            ),
          ],
        ),
      ),
    );
  }
}
