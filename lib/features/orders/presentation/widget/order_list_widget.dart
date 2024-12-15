import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/utils/widgets/buttons/carved_button.dart';
import '../../../../core/utils/widgets/spacing.dart';

class ListOrderWidget extends StatelessWidget {
  const ListOrderWidget(
      {super.key,
      required this.title,
      required this.price,
      required this.orderNumber,
      required this.imageUrl,
      required this.textButton,
      required this.itemCount});

  final String title, price, orderNumber, imageUrl, textButton;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: itemCount,
        itemBuilder: (index, context) {
          return Container(
            height: 125.h,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: MyColors.white70),
            ),
            child: Row(
              children: [
                Expanded(child: Image.asset(imageUrl,fit: BoxFit.cover,height: 109.h,width: 127.w,)),
                horizontalSpacing(16.w),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        title,
                        style: MyFonts.styleRegular400_12,
                      ),
                      Text(price, style: MyFonts.styleMedium500_12),
                      Text(orderNumber,
                          style: MyFonts.styleRegular400_12
                              .copyWith(color: MyColors.grey)),
                      verticalSpacing(8.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CurvedButton(
                          height: 30.h,
                        style:MyFonts.styleMedium500_13
                            .copyWith(color: MyColors.white),
                          color: MyColors.baseColor,
                          title: textButton,
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
