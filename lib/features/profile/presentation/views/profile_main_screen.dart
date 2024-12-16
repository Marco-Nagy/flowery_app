import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/features/auth/presentation/logout/widgets/logout_dialog.dart';
import 'package:flowery_e_commerce/features/profile/presentation/widgets/custom_app_bar_of_profile_main_screen.dart';
import 'package:flowery_e_commerce/features/profile/presentation/widgets/custom_main_profile_data.dart';
import 'package:flowery_e_commerce/features/profile/presentation/widgets/custom_switch_icon.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/models/language.dart';
import '../../../../core/provider/language_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
                    AppLocalizations.of(context)!.my_orders,
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
                    AppLocalizations.of(context)!.saved_address,
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
                AppLocalizations.of(context)!.language,
                style: MyFonts.styleRegular400_16.copyWith(
                  color: MyColors.blackBase,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  final currentLanguage = context.read<LanguageProvider>().selectedLanguage;
                  final newLanguage = currentLanguage.code == 'en'
                      ? Language(code: 'ar')
                      : Language(code: 'en');
                  context.read<LanguageProvider>().changeLanguage(newLanguage);
                },
                child: Consumer<LanguageProvider>(
                  builder: (context, provider, _) {
                    return Text(
                      provider.selectedLanguage.code == 'en' ? AppLocalizations.of(context)!.english : AppLocalizations.of(context)!.arabic,
                      style: MyFonts.styleRegular400_14.copyWith(
                        color: MyColors.baseColor,
                      ),
                    );
                  },
                ),
              ),
              ],
            ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.about_app,
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
                        AppLocalizations.of(context)!.terms_and_conditions,
                        style: MyFonts.styleRegular400_16.copyWith(
                          color: MyColors.blackBase,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context,AppRoutes.termsAndConditionsPage);
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
                    AppLocalizations.of(context)!.logout,
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
