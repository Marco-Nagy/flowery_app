import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/features/address/presentation/widgets/custom_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/lang_keys.dart';

class SavedAddressScreen extends StatefulWidget {
  const SavedAddressScreen({super.key});

  @override
  State<SavedAddressScreen> createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState extends State<SavedAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteBase,
      appBar: customAppBar(
        appBarTxt: context.translate(LangKeys.savedAddress),
        showArrow: true,
        context: context,
      ),
      body: Column(
        children: [
          const CustomCardItem(),
          SizedBox(
            width: 340.w,
            height: 65.h,
            child: CurvedButton(
                title: context.translate(LangKeys.addNewAddress),
                onTap: () {
                  context.pushNamed(AppRoutes.addressScreen);
                }),
          ),
        ],
      ),
    );
  }
}
