import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/lang_keys.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> termsData = [
      {
        'title': '1. ${context.translate(LangKeys.introduction)}',
        'description':
         context.translate(LangKeys.introductionDescription),
      },
      {
        'title': '2. ${context.translate(LangKeys.paymentTerms)}',
        'description':
         context.translate(LangKeys.paymentTermsDescription),
      },
      {
        'title': '3. ${context.translate(LangKeys.refundPolicy)}',
        'description':
          context.translate(LangKeys.refundPolicyDescription),
      },
      {
        'title': '4. ${context.translate(LangKeys.privacyPolicy)}',
        'description':
          context.translate(LangKeys.privacyPolicyDescription),
      },
      {
        'title': '5. ${context.translate(LangKeys.contactUs)}',
        'description':
          context.translate(LangKeys.contactUsDescription),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        appBarTxt: context.translate(LangKeys.termsAndConditions),
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
                  child: Text(context.translate(LangKeys.welcomeApp),
                      style: MyFonts.styleSemiBold600_18
                          .copyWith(color: MyColors.baseColor)),
                ),
                verticalSpacing(10.h),
                Text(
                  context.translate(LangKeys.welcomeAppDescription),
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
