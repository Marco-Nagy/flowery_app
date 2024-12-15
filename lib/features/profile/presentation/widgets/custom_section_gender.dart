import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';

class CustomSectionGender extends StatelessWidget {
  final String selectedGender;
  final ValueChanged<String> onChanged;

  const CustomSectionGender({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            AppLocalizations.of(context)!.gender,
            style: MyFonts.styleMedium500_18.copyWith(
              color: MyColors.gray,
            ),
          ),
        ),
        horizontalSpacing(15),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  title: AutoSizeText(
                    AppLocalizations.of(context)!.female,
                    style: MyFonts.styleRegular400_14,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  value: "female",
                  groupValue: selectedGender,
                  onChanged: (value) {
                    if (value != null) {
                      onChanged(value);
                    }
                  },
                  activeColor: MyColors.baseColor,
                ),
              ),
              Flexible(
                flex: 2,
                child: RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  title: AutoSizeText(
                    AppLocalizations.of(context)!.male,
                    style: MyFonts.styleRegular400_14.copyWith(
                      color: MyColors.gray,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  value: "male",
                  groupValue: selectedGender,
                  onChanged: (value) {
                    if (value != null) {
                      onChanged(value);
                    }
                  },
                  activeColor: MyColors.baseColor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
