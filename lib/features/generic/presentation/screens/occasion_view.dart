import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/viewModel/generic_item_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/widget/add_to_cart_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../generic_item_by_product/views/generic_item_screen.dart';
import 'catalog_generic_screen.dart';

class OccasionView extends StatelessWidget {
  const OccasionView({super.key});

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimationWidget(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(appBarTxt: 'Occasion', context: context, showArrow: true,actions: [    const SizedBox(width: 16),
          AddToCartIcon(
            key: context.read<GenericItemViewModelCubit>().cartKey,
            icon: const Icon(Icons.shopping_cart),
            badgeOptions: const BadgeOptions(
              active: true,
              backgroundColor: Colors.red,
            ),
          ),
          const SizedBox(
            width: 16,
          )]),
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
            GenericItemScreen(resourceName: 'occasions', field: 'occasion'),


          ],
        ),

         ),
    );
  }
}
