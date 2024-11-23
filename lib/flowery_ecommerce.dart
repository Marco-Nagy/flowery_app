import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/Services/shared_preference/shared_pref_keys.dart';
import 'core/Services/shared_preference/shared_preference_helper.dart';
import 'di/di.dart';

class FloweryEcommerce extends StatelessWidget {
   FloweryEcommerce({super.key});
  final GlobalKey<NavigatorState> navigatorKey =
  getIt<GlobalKey<NavigatorState>>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        initialRoute: AppRoutes.homeScreen,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        navigatorKey: getIt<GlobalKey<NavigatorState>>(),
      ),
    );
  }
}

String _getInitialRoute() {
  return SharedPrefHelper().getString(key: SharedPrefKeys.tokenKey) != null
      ? AppRoutes.homeScreen
      : AppRoutes.login;
}