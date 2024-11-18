import 'package:flowery_e_commerce/core/routes/base_routes.dart';
import 'package:flowery_e_commerce/core/utils/screens/under_build_screen.dart';
import 'package:flowery_e_commerce/features/auth/presentation/login/pages/login_view.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/screens/home_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String register = 'register';
  static const String forgetPassword = 'forgetPassword';
  static const String emailVerification = 'emailVerification';
  static const String resetPassWord = 'resetPassWord';
  static const String changePassWord = 'changePassWord';
  static const String homeScreen = 'homeScreen';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.login:
        return BaseRoute(
          page: LoginView(),
        );
      case AppRoutes.homeScreen:
        return BaseRoute(
          page: HomeScreen(),
        );
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
