import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/spacing.dart';
import '../view_model/signup_action.dart';
import '../view_model/signup_view_model_cubit.dart';


class GenderSelection extends StatelessWidget {
  const GenderSelection({super.key, required this.cubit});
  final SignUpViewModel cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Gender',
          style: MyFonts.styleMedium500_18.copyWith(
            color: MyColors.gray,
          ),
        ),
        horizontalSpacing(
          15,
        ),
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
            groupValue: cubit.selectedGender,
            onChanged: (value) {
              cubit.doAction(GenderSelected(value!));
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
            groupValue: cubit.selectedGender,
            onChanged: (value) {
              cubit.doAction(GenderSelected(value!));
            },
            activeColor: MyColors.baseColor,
          ),
        ),
      ],
    );
  }
}
