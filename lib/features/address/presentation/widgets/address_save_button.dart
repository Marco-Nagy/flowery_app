import 'package:flowery_e_commerce/core/localization/lang_keys.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/utils/widgets/buttons/carved_button.dart';

class AddressSaveButton extends StatelessWidget {
  final bool isButtonEnabled;
  final VoidCallback onTap;

  const AddressSaveButton({
    required this.isButtonEnabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340.w,
      height: 65.h,
      child: CurvedButton(
        title:context.translate(LangKeys.saveAddress) ,
        onTap: isButtonEnabled ? onTap : () {},
        color: isButtonEnabled ? MyColors.baseColor : MyColors.gray30,
      ),
    );
  }
}
