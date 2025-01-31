import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          hint: AppLocalizations.of(context)!.hintUserName,
          label: AppLocalizations.of(context)!.labelUserName,
          controller: usernameController,
        ),
        SizedBox(height: 10.h),
        BuildTextFieldWidget(
          hint: AppLocalizations.of(context)!.enter_phone_number,
          label: AppLocalizations.of(context)!.phone_number,
          controller: phoneController,
        ),
        SizedBox(height: 10.h),
        BuildTextFieldWidget(
          hint: AppLocalizations.of(context)!.street,
          label: AppLocalizations.of(context)!.street,
          controller: streetController,
        ),
        SizedBox(height: 10.h),
        BuildTextFieldWidget(
          hint: AppLocalizations.of(context)!.city,
          label: AppLocalizations.of(context)!.select_city,
          controller: cityController,
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: BuildTextFieldWidget(
                hint: AppLocalizations.of(context)!.latitude,
                label: AppLocalizations.of(context)!.latitude,
                controller: latitudeController,
              ),
            ),
            SizedBox(width: 10.h),
            Expanded(
              child: BuildTextFieldWidget(
                hint: AppLocalizations.of(context)!.longitude,
                label: AppLocalizations.of(context)!.longitude,
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
