import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/buttons/add_cart_button.dart';
import '../../../../core/utils/widgets/spacing.dart';
import 'cached_network_widget.dart';

class GenericItem extends StatelessWidget {
  const GenericItem({super.key, required this.name, required this.image});

 final String name;
 final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: MyColors.white70),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150.h,
            width: double.infinity,
            child: CachedNetworkWidget(
                imageUrl: image
            ),
          ),
          verticalSpacing(8.h),
          Text(
            name,
            style: MyFonts.styleRegular400_14.copyWith(color: MyColors.black),
          ),
          verticalSpacing(11.h),
          AddCartButton(onTap: () {}),
        ],
      ),
    );
  }
}
