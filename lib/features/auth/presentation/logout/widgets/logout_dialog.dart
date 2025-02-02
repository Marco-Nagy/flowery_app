import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/auth/data/data_sources/contracts/offline_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import '../../../../../core/localization/lang_keys.dart';
void showLogoutDialog(BuildContext context) {
  final OfflineDataSource offlineDataSource = getIt<OfflineDataSource>();

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: SizedBox(
            width: 800.w,
            height: 300.h,
            child: AlertDialog(
              content: Column(
                children: [
                  Text(
                 context.translate(LangKeys.logout),
                  style: MyFonts.styleSemiBold600_18.copyWith(
                      color: MyColors.blackBase,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Text(
                 context.translate(LangKeys.confirmLogout),
                    style: MyFonts.styleRegular400_18
                        .copyWith(color: MyColors.blackBase),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 115.w,
                        height: 55.h,
                        child: CurvedButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: context.translate(LangKeys.cancel),
                          color: MyColors.whiteBase,
                          textColor: MyColors.grey,
                          colorBorderSide: MyColors.gray,
                        ),
                      ),
                      SizedBox(
                        width: 115.w,
                        height: 55.h,
                        child: CurvedButton(
                          title: context.translate(LangKeys.logout),
                          onTap: () {
                            offlineDataSource.deleteCachedToken();
                            context.pushReplacementNamed(AppRoutes.login);
                            aweSnackBar(
                                msg: context.translate(LangKeys.logoutSuccessfully),
                                context: context,
                                type: MessageTypeConst.success,
                                title: context.translate(LangKeys.success)
                            );
                          },
                          color: MyColors.baseColor,
                          textColor: MyColors.whiteBase,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
