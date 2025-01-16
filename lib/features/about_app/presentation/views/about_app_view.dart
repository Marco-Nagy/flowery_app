import 'package:flutter/material.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../widgets/app_logo_section.dart';
import '../widgets/section_header.dart';
import '../widgets/horizontal_card_scroll.dart';
import '../widgets/app_info_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.about_flowery_app,
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
            sectionHeader(title:AppLocalizations.of(context)!.categories,
            ),
            horizontalCardScroll([
              {'title': AppLocalizations.of(context)!.birthday_flowers, 'icon': Icons.cake},
              {'title': AppLocalizations.of(context)!.anniversary, 'icon': Icons.event},
              {'title': AppLocalizations.of(context)!.get_well_soon, 'icon': Icons.local_hospital},
            ]),
            verticalSpacing(20),
            sectionHeader(title: AppLocalizations.of(context)!.best_sellers),
            horizontalCardScroll([
              {'title': AppLocalizations.of(context)!.rose_bouquet, 'icon': Icons.local_florist},
              {'title': AppLocalizations.of(context)!.lily_bunch, 'icon': Icons.spa},
            ]),
            verticalSpacing(30),
            const AppInfoSection(),
            verticalSpacing(20),
             Text(
                AppLocalizations.of(context)!.copyright_notice,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            verticalSpacing(10),
          ],
        ),
      ),
    );
  }
}
