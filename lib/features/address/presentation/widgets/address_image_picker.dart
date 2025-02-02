import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../generated/assets.dart';

class AddressImagePickerWidget extends StatelessWidget {
  final TextEditingController streetController;
  final TextEditingController cityController;
  final TextEditingController longitudeController;
  final TextEditingController latitudeController;

  const AddressImagePickerWidget({
    required this.streetController,
    required this.cityController,
    required this.longitudeController,
    required this.latitudeController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.pushNamed(context, AppRoutes.mapView);

        if (result != null && result is Map<String, String>) {
          streetController.text = result['street'] ?? '';
          cityController.text = result['city'] ?? '';
          longitudeController.text = result['longitude'] ?? '';
          latitudeController.text = result['latitude'] ?? '';
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        width: 390.w,
        height: 200.h,
        child: Image.asset(Assets.imagesRectangle, fit: BoxFit.cover),
      ),
    );
  }
}
