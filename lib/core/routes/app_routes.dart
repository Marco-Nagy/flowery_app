import 'package:flowery_e_commerce/core/routes/base_routes.dart';
import 'package:flowery_e_commerce/core/utils/screens/under_build_screen.dart';
import 'package:flowery_e_commerce/features/auth/presentation/signup/views/signup_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/login/pages/login_view.dart';



class AppRoutes {
  static const String login = '/';
  static const String signup = 'signup';
  static const String forgetPassword = 'forgetPassword';
  static const String emailVerification = 'emailVerification';
  static const String resetPassWord = 'resetPassWord';
  static const String changePassWord = 'changePassWord';


  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.login:
        return BaseRoute(
          page: const LoginView(),
        );
      case AppRoutes.signup:
        return BaseRoute(
          page: const SignUpView(),
        );
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
