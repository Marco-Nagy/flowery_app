import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> termsData = [
      {
        'title': '1. ${AppLocalizations.of(context)!.introduction}',
        'description':
         AppLocalizations.of(context)!.introduction_description,
      },
      {
        'title': '2. ${AppLocalizations.of(context)!.payment_terms}',
        'description':
        AppLocalizations.of(context)!.payment_terms_description,
      },
      {
        'title': '3. ${AppLocalizations.of(context)!.refund_policy}',
        'description':
        AppLocalizations.of(context)!.refund_policy_description,
      },
      {
        'title': '4. ${AppLocalizations.of(context)!.privacy_policy}',
        'description':
        AppLocalizations.of(context)!.privacy_policy_description,
      },
      {
        'title': '5. ${AppLocalizations.of(context)!.contact_us}',
        'description':
        AppLocalizations.of(context)!.contact_us_description,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        appBarTxt: AppLocalizations.of(context)!.terms_and_conditions,
        context: context,
        showArrow: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: termsData.length + 1,
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpacing(20.h),
                InkWell(
                  onTap: () => throw Exception(),
                  child: Text(AppLocalizations.of(context)!.welcome_app,
                      style: MyFonts.styleSemiBold600_18
                          .copyWith(color: MyColors.baseColor)),
                ),
                verticalSpacing(10.h),
                Text(
                  AppLocalizations.of(context)!.welcome_app_description,
                  style: MyFonts.styleRegular400_14,
                ),
              ],
            );
          } else {
            final term = termsData[index - 1];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(term['title']!,
                    style: MyFonts.styleSemiBold600_16
                        .copyWith(color: MyColors.baseColor)),
                verticalSpacing(5.h),
                Text(term['description']!, style: MyFonts.styleRegular400_14),
              ],
            );
          }
        },
      ),
    );
  }
}
