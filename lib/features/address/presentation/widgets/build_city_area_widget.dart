import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';
import '../../../auth/presentation/login/widgets/custom_text_form_field.dart';

class BuildCityAreaWidget extends StatelessWidget {
  const BuildCityAreaWidget(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller});

  final String label, hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.sp),
      width: 160.w,
      child: CustomTextFormField(
        labelText: label,
        hintText: hint,
        controller: controller,
        suffix: SizedBox(
          width: 16.w,
          height: 16.h,
          child: Image.asset(Assets.imagesArrowDownIos),
        ),
      ),
    );
  }
}
