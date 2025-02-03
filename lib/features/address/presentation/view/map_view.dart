import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../view_model/map_view_model.dart';
import '../widgets/confirm_location_button.dart';
import '../widgets/map_widget.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MapViewModel()..getCurrentLocation(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white.withValues(alpha: 0.95),
          elevation: 3,
          centerTitle: true,
          title: Text(
            "Map View",
            style:
                MyFonts.styleMedium500_20.copyWith(color: MyColors.baseColor),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(50),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: MyColors.baseColor,
                size: 22.sp,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            MapWidget(),
            Positioned(
              bottom: 20.h,
              left: 20.w,
              child: ConfirmLocationButton(),
            ),
          ],
        ),
      ),
    );
  }
}
