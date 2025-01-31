import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../view_model/map_view_model.dart';

class ConfirmLocationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.h,
      left: 20.w,
      child: ElevatedButton(
        onPressed: () {
          final model = Provider.of<MapViewModel>(context, listen: false);
          Navigator.pop(context, model.getLocationData());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.baseColor,
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Consumer<MapViewModel>(
          builder: (context, model, child) {
            return model.isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
                    AppLocalizations.of(context)!.confirm_location,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
