import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/presentation/login/widgets/custom_text_form_field.dart';

class BuildTextFieldWidget extends StatelessWidget {
  const BuildTextFieldWidget(
      {super.key,
      required this.hint,
      required this.label,
      required this.controller});

  final String hint, label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.sp),
      child: CustomTextFormField(
        hintText: hint,
        labelText: label,
        controller: controller,
      ),
    );
  }
}
