import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/features/auth/presentation/logout/widgets/logout_dialog.dart';
import 'package:flowery_e_commerce/features/profile/presentation/widgets/custom_app_bar_of_profile_main_screen.dart';
import 'package:flowery_e_commerce/features/profile/presentation/widgets/custom_main_profile_data.dart';
import 'package:flowery_e_commerce/features/profile/presentation/widgets/custom_switch_icon.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_state.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/localization/app_localizations.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        actions: const [
          CustomAppBarOfProfileMainScreen(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomMainProfileData(),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.all(30.sp),
              child: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Image.asset(
                      Assets.imagesTermsConditions,
                    ),
                  ),
                  SizedBox(
                    width: 3.sp,
                  ),
                  Text(
                    context.translate(LangKeys.myOrders),
                    style: MyFonts.styleRegular400_16.copyWith(
                      color: MyColors.blackBase,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      context.pushNamed(AppRoutes.orderView);
                    },
                    child: SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: Image.asset(
                          Assets.imagesDropDownArrow,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30.sp, left: 29.sp),
              child: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Image.asset(
                      Assets.imagesLocation,
                    ),
                  ),
                  SizedBox(
                    width: 3.sp,
                  ),
                  Text(
                    context.translate(LangKeys.savedAddress),
                    style: MyFonts.styleRegular400_16.copyWith(
                      color: MyColors.blackBase,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      context.pushNamed(AppRoutes.savedAddressScreen);
                    },
                    child: SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: Image.asset(
                          Assets.imagesDropDownArrow,
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              width: double.infinity,
              height: 1.h,
              color: MyColors.white70,
            ),
            const CustomSwitchIcon(),
            Container(
              width: double.infinity,
              height: 1.h,
              color: MyColors.white70,
            ),
            Container(
              margin: EdgeInsets.all(30.sp),
              height: 150.h,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: Image.asset(Assets.imagesLanguage),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        context.translate(LangKeys.language),
                        style: MyFonts.styleRegular400_16.copyWith(
                          color: MyColors.blackBase,
                        ),
                      ),
                      const Spacer(),
                      BlocBuilder<AppCubit, AppStates>(
                          builder: (context, state) {
                        final cubit = context.read<AppCubit>();

                        return InkWell(
                          onTap: () {
                            AppLocalizations.of(context)!.isEnLocale
                                ? cubit.toArabic()
                                : cubit.toEnglish();
                          },
                          child: Text(
                              AppLocalizations.of(context)!.isEnLocale
                                  ? context.translate(LangKeys.english)
                                  : context.translate(LangKeys.arabic),
                              style: MyFonts.styleMedium500_14),
                        );
                      }),

                      // InkWell(
                      //   onTap: () {
                      //     final currentLanguage = context.read<LanguageProvider>().selectedLanguage;
                      //     final newLanguage = currentLanguage.code == 'en'
                      //         ? Language(code: 'ar')
                      //         : Language(code: 'en');
                      //     context.read<LanguageProvider>().changeLanguage(newLanguage);
                      //   },
                      //   child: Consumer<LanguageProvider>(
                      //     builder: (context, provider, _) {
                      //       return Text(
                      //         provider.selectedLanguage.code == 'en' ? AppLocalizations.of(context)!.english : AppLocalizations.of(context)!.arabic,
                      //         style: MyFonts.styleRegular400_14.copyWith(
                      //           color: MyColors.baseColor,
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      Text(
                        context.translate(LangKeys.aboutApp),
                        style: MyFonts.styleRegular400_16.copyWith(
                          color: MyColors.blackBase,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          context.pushNamed(AppRoutes.aboutAppView);
                        },
                        child: SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: Image.asset(
                              Assets.imagesDropDownArrow,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      Text(
                        context.translate(LangKeys.termsAndConditions),
                        style: MyFonts.styleRegular400_16.copyWith(
                          color: MyColors.blackBase,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.termsAndConditionsPage);
                        },
                        child: SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: Image.asset(
                              Assets.imagesDropDownArrow,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              width: double.infinity,
              height: 1.h,
              color: MyColors.white70,
            ),
            Container(
              margin: EdgeInsets.all(30.sp),
              child: Row(
                children: [
                  SizedBox(
                      width: 18.sp,
                      height: 18.sp,
                      child: Image.asset(Assets.imagesLogoutBlack)),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    context.translate(LangKeys.logout),
                    style: MyFonts.styleRegular400_16.copyWith(
                      color: MyColors.blackBase,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      showLogoutDialog(context);
                    },
                    child: SizedBox(
                        width: 30.w,
                        height: 30.w,
                        child: Image.asset(
                          Assets.imagesLogout,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
