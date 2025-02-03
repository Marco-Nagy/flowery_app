import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../widgets/app_logo_section.dart';
import '../widgets/section_header.dart';
import '../widgets/horizontal_card_scroll.dart';
import '../widgets/app_info_section.dart';
class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        title: Text(
          (context.translate(LangKeys.aboutFloweryApp)),
          style: MyFonts.styleMedium500_20.copyWith(color: MyColors.white),
        ),
        centerTitle: true,
        backgroundColor: MyColors.baseColor,
        elevation: 4,
        shadowColor: MyColors.baseColor.withValues(alpha:0.5),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpacing(20),
            const AppLogoSection(),
            verticalSpacing(20),
            sectionHeader(title:(context.translate(LangKeys.categories)),
            ),
            horizontalCardScroll([
              {'title': (context.translate(LangKeys.birthdayFlowers)), 'icon': Icons.cake},
              {'title': (context.translate(LangKeys.anniversary)), 'icon': Icons.event},
              {'title': (context.translate(LangKeys.getWellSoon)), 'icon': Icons.local_hospital},
            ]),
            verticalSpacing(20),
            sectionHeader(title: (context.translate(LangKeys.bestSeller)),),
            horizontalCardScroll([
              {'title': (context.translate(LangKeys.roseBouquet)), 'icon': Icons.local_florist},
              {'title': (context.translate(LangKeys.lilyBunch)), 'icon': Icons.spa},
            ]),
            verticalSpacing(30),
            const AppInfoSection(),
            verticalSpacing(20),
             Text(
              (context.translate(LangKeys.copyrightNotice)),
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            verticalSpacing(10),
          ],
        ),
      ),
    );
  }
}
