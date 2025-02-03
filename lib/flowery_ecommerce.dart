import 'package:flowery_e_commerce/core/services/connectivity_controller.dart';
import 'package:flowery_e_commerce/core/services/shared_preference/shared_pref_keys.dart';
import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/provider/language_provider.dart';
import 'core/services/shared_preference/shared_preference_helper.dart';
import 'core/utils/screens/no_network_screen.dart';
import 'di/di.dart';

class FloweryEcommerce extends StatelessWidget {
  FloweryEcommerce({super.key});

  final GlobalKey<NavigatorState> navigatorKey =
      getIt<GlobalKey<NavigatorState>>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, value, child) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            child: ChangeNotifierProvider(
                create: (context) =>
                    getIt<LanguageProvider>()..loadSelectedLanguage(),
                child: Consumer<LanguageProvider>(
                  builder: (context, languageProvider, _) => MaterialApp(
                    supportedLocales: AppLocalizations.supportedLocales,
                    locale: Locale(languageProvider.selectedLanguage.code),
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    initialRoute: _getInitialRoute(),
                    debugShowCheckedModeBanner: false,
                    builder: (context, child) {
                      return Scaffold(
                        body: Builder(
                          builder: (context) {
                            ConnectivityController.instance.init();
                            return child!;
                          },
                        ),
                      );

                    },
                    onGenerateRoute: AppRoutes.onGenerateRoute,
                    navigatorKey: getIt<GlobalKey<NavigatorState>>(),
                  ),
                )),
          );
        } else {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: NoNetworkScreen(),
          );
        }
      },
    );
  }
}

String _getInitialRoute() {
  return SharedPrefHelper().getString(key: SharedPrefKeys.tokenKey) != null
      ? AppRoutes.homeScreen
      : AppRoutes.login;
}
