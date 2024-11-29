import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/spacing.dart';
import '../generic_item_by_product/views/generic_item_screen.dart';

class OccasionView extends StatelessWidget {
  const OccasionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(appBarTxt: 'Occasion', context: context, showArrow: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text('Bloom with our exquisite best sellers'
              ,style: MyFonts.styleMedium500_14.copyWith(color: MyColors.gray),),
          ),

          verticalSpacing(20),
         // CatalogGenericScreen(resourceName: 'occasions',),
          const GenericItemScreen(resourceName: 'occasions', field: 'occasion'),


        ],
      ),

   );
  }
}
