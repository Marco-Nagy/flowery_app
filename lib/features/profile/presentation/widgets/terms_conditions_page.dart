import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> termsData = [
      {
        'title': '1. Introduction',
        'description':
            'Flowery is an online marketplace where you can purchase floral products and gifts. These terms apply to all users of the app.',
      },
      {
        'title': '2. Payment Terms',
        'description':
            'All payments are processed securely. Please ensure that your payment details are accurate to avoid disruptions.',
      },
      {
        'title': '3. Refund Policy',
        'description':
            'Refunds are issued in accordance with our refund policy. Products must be returned in their original condition.',
      },
      {
        'title': '4. Privacy Policy',
        'description':
            'We take your privacy seriously. Your data is protected and will not be shared with third parties.',
      },
      {
        'title': '5. Contact Us',
        'description':
            'If you have any questions or concerns, please contact us at [Your Contact Information].',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        appBarTxt: 'Terms & Conditions',
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
                Text('Welcome to Flowery App!',
                    style: MyFonts.styleSemiBold600_18
                        .copyWith(color: MyColors.baseColor)),
                verticalSpacing(10.h),
                Text(
                  'By using our app, you agree to the following terms and conditions. Please read them carefully before proceeding.',
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
