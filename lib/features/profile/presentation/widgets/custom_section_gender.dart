import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';

class CustomSectionGender extends StatelessWidget {
  final String selectedGender;
  final ValueChanged<String> onChanged;

  const CustomSectionGender({
    Key? key,
    required this.selectedGender,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            'Gender',
            style: MyFonts.styleMedium500_18.copyWith(
              color: MyColors.gray,
            ),
          ),
        ),
        const SizedBox(width: 15),
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
                    "female",
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
                    "male",
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
