import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/entities/most_selling_entity.dart';
import 'package:flowery_e_commerce/features/best_seller/presentation/cubit/most_seller_states.dart';
import 'package:flowery_e_commerce/features/best_seller/presentation/cubit/most_selling_cubit.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/viewModel/categories_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/viewModel/generic_item_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/widget/add_to_cart_animation_widget.dart';
import 'package:flowery_e_commerce/features/generic/presentation/widgets/build_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/spacing.dart';

class MostSellingScreen extends StatefulWidget {
   MostSellingScreen({super.key});

  @override
  State<MostSellingScreen> createState() => _MostSellingScreenState();
}

class _MostSellingScreenState extends State<MostSellingScreen> {
  MostSellerCubit mostSellerCubit = getIt.get<MostSellerCubit>()
    ..getMostSellers();

   late Function(GlobalKey) addToCartAnimation;
  final cartKey = GlobalKey<CartIconKey>();
  CartViewModelCubit   viewModelCubit= getIt.get<CartViewModelCubit>();

   void listClick(GlobalKey widgetKey) async {
     await addToCartAnimation(widgetKey);
     await viewModelCubit.addToCart();
    await viewModelCubit.cartKey.currentState!.runCartAnimation(viewModelCubit.cartQuantityItems.toString());
   }
  @override
  void initState() {
    super.initState();
    // Initialize the cart count to 20
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // viewModelCubit.cartQuantityItems = 20;
      viewModelCubit.updateCartCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mostSellerCubit,
      child: AddToCartAnimation(
        cartKey: viewModelCubit.cartKey,
        height: 30,
        width: 30,
        opacity: 0.85,
        dragAnimation: const DragToCartAnimationOptions(
          rotation: true,
        ),
        jumpAnimation: const JumpAnimationOptions(),
        createAddToCartAnimation: (runAddToCartAnimation) {
          addToCartAnimation = runAddToCartAnimation;


          // return (GlobalKey) => addToCartAnimation(GlobalKey(cartKey));
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: customAppBar(
            appBarTxt: 'Best seller',
            context: context,
            showArrow: true,
              actions: [
                const SizedBox(width: 16),
                AddToCartIcon(
                  key: viewModelCubit.cartKey,
                  icon: const Icon(Icons.shopping_cart),
                  badgeOptions: const BadgeOptions(
                    active: true,
                    backgroundColor: Colors.red,
                  ),
                ),
                const SizedBox(
                  width: 16,
                )
              ]),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text('Bloom with our exquisite best sellers',style:MyFonts.styleMedium500_14.copyWith(
                    color: MyColors.grey,
                  ) ,),
                ),
                verticalSpacing(20),

                BuildItem(onClick:(widgetKey)=>listClick(widgetKey)),
              ],
            ),
          ),
        ),
      ),
    );
            }
}

