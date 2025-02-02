import 'package:flowery_e_commerce/core/localization/lang_keys.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'build_text_field_widget.dart';

class AddressInputFieldsWidget extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController phoneController;
  final TextEditingController streetController;
  final TextEditingController cityController;
  final TextEditingController latitudeController;
  final TextEditingController longitudeController;

  const AddressInputFieldsWidget({
    required this.usernameController,
    required this.phoneController,
    required this.streetController,
    required this.cityController,
    required this.latitudeController,
    required this.longitudeController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildTextFieldWidget(
          hint: context.translate(LangKeys.hintUserName),
          label: context.translate(LangKeys.labelUserName),
          controller: usernameController,
        ),
        SizedBox(height: 10.h),
        BuildTextFieldWidget(
          hint:context.translate(LangKeys.enterPhoneNumber) ,
          label: context.translate(LangKeys.phoneNumber),
          controller: phoneController,
        ),
        SizedBox(height: 10.h),
        BuildTextFieldWidget(
          hint: context.translate(LangKeys.street),
          label: context.translate(LangKeys.street),
          controller: streetController,
        ),
        SizedBox(height: 10.h),
        BuildTextFieldWidget(
          hint: context.translate(LangKeys.city),
          label: context.translate(LangKeys.selectCity),
          controller: cityController,
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: BuildTextFieldWidget(
                hint: context.translate(LangKeys.latitude),
                label: context.translate(LangKeys.latitude),
                controller: latitudeController,
              ),
            ),
            SizedBox(width: 10.h),
            Expanded(
              child: BuildTextFieldWidget(
                hint: context.translate(LangKeys.longitude),
                label: context.translate(LangKeys.longitude),
                controller: longitudeController,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
